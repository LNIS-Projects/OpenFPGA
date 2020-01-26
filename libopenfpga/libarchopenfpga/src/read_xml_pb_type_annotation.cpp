/********************************************************************
 * This file includes the top-level function of this library
 * which reads an XML modeling OpenFPGA architecture to the associated
 * data structures
 *******************************************************************/
#include <string>

/* Headers from pugi XML library */
#include "pugixml.hpp"
#include "pugixml_util.hpp"

/* Headers from vtr util library */
#include "vtr_assert.h"

/* Headers from openfpga util library */
#include "openfpga_port_parser.h"

/* Headers from libarchfpga */
#include "arch_error.h"
#include "read_xml_util.h"

#include "read_xml_pb_type_annotation.h"

/********************************************************************
 * Parse XML description for an interconnection annotation 
 * under a <pb_type> XML node
 *******************************************************************/
static 
void read_xml_interc_annotation(pugi::xml_node& xml_interc,
                                 const pugiutil::loc_data& loc_data,
                                 openfpga::PbTypeAnnotation& pb_type_annotation) {
  /* We have two mandatory XML attribute
   * 1. name of the interconnect
   * 2. circuit model name of the interconnect 
   */
  const std::string& name_attr = get_attribute(xml_interc, "name", loc_data).as_string();
  const std::string& circuit_model_name_attr = get_attribute(xml_interc, "circuit_model_name", loc_data).as_string();

  pb_type_annotation.add_interconnect_circuit_model_pair(name_attr, circuit_model_name_attr);
}

/********************************************************************
 * Parse XML description for a pb_type port annotation 
 * under a <pb_type> XML node
 *******************************************************************/
static 
void read_xml_pb_port_annotation(pugi::xml_node& xml_port,
                                 const pugiutil::loc_data& loc_data,
                                 openfpga::PbTypeAnnotation& pb_type_annotation) {
  /* We have two mandatory XML attribute
   * 1. name of the port
   * 2. name of the port to be binded in physical mode
   */
  const std::string& name_attr = get_attribute(xml_port, "name", loc_data).as_string();
  const std::string& physical_mode_port_attr = get_attribute(xml_port, "physical_mode_port", loc_data).as_string();

  /* Parse the mode port using openfpga port parser */
  openfpga::PortParser port_parser(physical_mode_port_attr); 
  pb_type_annotation.add_pb_type_port_pair(name_attr, port_parser.port());

  /* We have an optional attribute: physical_mode_pin_rotate_offset */
  pb_type_annotation.set_physical_pin_rotate_offset(name_attr, get_attribute(xml_port, "physical_mode_pin_rotate_offset", loc_data, pugiutil::ReqOpt::OPTIONAL).as_int(0));
}

/********************************************************************
 * Parse XML description for a pb_type annotation under a <pb_type> XML node
 *******************************************************************/
static 
void read_xml_pb_type_annotation(pugi::xml_node& xml_pb_type,
                                 const pugiutil::loc_data& loc_data,
                                 std::vector<openfpga::PbTypeAnnotation>& pb_type_annotations) {
  openfpga::PbTypeAnnotation pb_type_annotation;

  /* Find the name of pb_type */
  const std::string& name_attr = get_attribute(xml_pb_type, "name", loc_data).as_string();
  const std::string& physical_name_attr = get_attribute(xml_pb_type, "physical_pb_type_name", loc_data, pugiutil::ReqOpt::OPTIONAL).as_string();
  const std::string& physical_mode_name_attr = get_attribute(xml_pb_type, "physical_mode_name", loc_data, pugiutil::ReqOpt::OPTIONAL).as_string();

  /* If both names are not empty, this is a operating pb_type */
  if ( (false == name_attr.empty()) 
    && (false == physical_name_attr.empty()) ) {
    /* Parse the attributes for operating pb_type */
    pb_type_annotation.set_operating_pb_type_name(name_attr);
    pb_type_annotation.set_physical_pb_type_name(physical_name_attr);
  } 

  /* If there is only a name, this is a physical pb_type */
  if ( (false == name_attr.empty()) 
    && (true == physical_name_attr.empty()) ) {
    pb_type_annotation.set_physical_pb_type_name(name_attr);
  }

  /* Parse physical mode name which are applied to both pb_types */
  pb_type_annotation.set_physical_mode_name(get_attribute(xml_pb_type, "physical_mode_name", loc_data, pugiutil::ReqOpt::OPTIONAL).as_string());

  /* Parse idle mode name which are applied to both pb_types */
  pb_type_annotation.set_idle_mode_name(get_attribute(xml_pb_type, "idle_mode_name", loc_data, pugiutil::ReqOpt::OPTIONAL).as_string());

  /* Parse mode bits which are applied to both pb_types */
  pb_type_annotation.set_mode_bits(get_attribute(xml_pb_type, "mode_bits", loc_data, pugiutil::ReqOpt::OPTIONAL).as_string());

  /* If this is a physical pb_type, circuit model name is a mandatory attribute */
  if (true == pb_type_annotation.is_physical_pb_type()) {
    pb_type_annotation.set_circuit_model_name(get_attribute(xml_pb_type, "circuit_model_name", loc_data).as_string());
  }

  /* If this is an operating pb_type, index factor and offset may be optional needed */
  if (true == pb_type_annotation.is_operating_pb_type()) {
    pb_type_annotation.set_physical_pb_type_index_factor(get_attribute(xml_pb_type, "physical_pb_type_index_factor", loc_data, pugiutil::ReqOpt::OPTIONAL).as_int(1));
    pb_type_annotation.set_physical_pb_type_index_offset(get_attribute(xml_pb_type, "physical_pb_type_index_offset", loc_data, pugiutil::ReqOpt::OPTIONAL).as_int(0));
  }

  /* Parse all the interconnect-to-circuit binding under this node
   * All the bindings are defined in child node <interconnect>
   */
  size_t num_intercs = count_children(xml_pb_type, "interconnect", loc_data, pugiutil::ReqOpt::OPTIONAL);
  if (0 < num_intercs) {
    pugi::xml_node xml_interc = get_first_child(xml_pb_type, "interconnect", loc_data);
    while (xml_interc) {
      read_xml_interc_annotation(xml_interc, loc_data, pb_type_annotation);
      xml_interc = xml_interc.next_sibling(xml_interc.name());
    } 
  }

  /* Parse all the port-to-port binding from operating pb_type to physical pb_type under this node
   * All the bindings are defined in child node <port>
   * This is only applicable to operating pb_type
   */
  if (true == pb_type_annotation.is_operating_pb_type()) {
    size_t num_ports = count_children(xml_pb_type, "port", loc_data, pugiutil::ReqOpt::OPTIONAL);
    if (0 < num_ports) {
      pugi::xml_node xml_port = get_first_child(xml_pb_type, "port", loc_data);
      while (xml_port) {
        read_xml_pb_port_annotation(xml_port, loc_data, pb_type_annotation);
        xml_port = xml_port.next_sibling(xml_port.name());
      } 
    }
  }

  /* Finish parsing and add it to the vector */ 
  pb_type_annotations.push_back(pb_type_annotation);
}

/********************************************************************
 * Top function to parse XML description about pb_type annotation 
 *******************************************************************/
std::vector<openfpga::PbTypeAnnotation> read_xml_pb_type_annotations(pugi::xml_node& Node,
                                                                     const pugiutil::loc_data& loc_data) {
  std::vector<openfpga::PbTypeAnnotation> pb_type_annotations;

  /* Parse configuration protocol root node */
  pugi::xml_node xml_annotations = get_single_child(Node, "pb_type_annotations", loc_data);

  /* Iterate over the children under this node,
   * each child should be named after <pb_type>
   */
  for (pugi::xml_node xml_pb_type : xml_annotations.children()) {
    /* Error out if the XML child has an invalid name! */
    if (xml_pb_type.name() != std::string("pb_type")) {
      bad_tag(xml_pb_type, loc_data, xml_annotations, {"pb_type"});
    }
    read_xml_pb_type_annotation(xml_pb_type, loc_data, pb_type_annotations);
  } 

  return pb_type_annotations;
}
