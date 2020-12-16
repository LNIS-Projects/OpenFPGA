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

/* Headers from libarchfpga */
#include "arch_error.h"
#include "read_xml_util.h"

#include "read_xml_config_protocol.h"

/********************************************************************
 * Convert string to the enumerate of configuration protocol type
 *******************************************************************/
static 
e_config_protocol_type string_to_config_protocol_type(const std::string& type_string) {
  
  for (size_t itype = 0; itype < NUM_CONFIG_PROTOCOL_TYPES; ++itype) {
    if (std::string(CONFIG_PROTOCOL_TYPE_STRING[itype]) == type_string) {
      return static_cast<e_config_protocol_type>(itype); 
    }
  }

  return NUM_CONFIG_PROTOCOL_TYPES;
}

/********************************************************************
 * Parse XML codes of a <organization> to an object of configuration protocol
 *******************************************************************/
static 
void read_xml_config_organization(pugi::xml_node& xml_config_orgz,
                                  const pugiutil::loc_data& loc_data,
                                  ConfigProtocol& config_protocol) {
  /* Find the type of configuration protocol */
  const char* type_attr = get_attribute(xml_config_orgz, "type", loc_data).value();
  /* Translate the type of design technology to enumerate */
  e_config_protocol_type config_orgz_type = string_to_config_protocol_type(std::string(type_attr));

  if (NUM_CONFIG_PROTOCOL_TYPES == config_orgz_type) {
    archfpga_throw(loc_data.filename_c_str(), loc_data.line(xml_config_orgz),
                   "Invalid 'type' attribute '%s'\n",
                   type_attr);
  }

  config_protocol.set_type(config_orgz_type);

  /* Find the circuit model used by the configuration protocol */
  config_protocol.set_memory_model_name(get_attribute(xml_config_orgz, "circuit_model_name", loc_data).as_string());

  /* Parse the number of configurable regions
   * At least 1 region should be defined, otherwise error out 
   */
  config_protocol.set_num_regions(get_attribute(xml_config_orgz, "num_regions", loc_data, pugiutil::ReqOpt::OPTIONAL).as_int(1));
  if (1 > config_protocol.num_regions()) {
    archfpga_throw(loc_data.filename_c_str(), loc_data.line(xml_config_orgz),
                   "Invalid 'num_region=%d' definition. At least 1 region should be defined!\n",
                   config_protocol.num_regions());
  }
}

/********************************************************************
 * Parse XML codes about <configuration_protocol> to an object of ConfigProtocol
 *******************************************************************/
ConfigProtocol read_xml_config_protocol(pugi::xml_node& Node,
                                        const pugiutil::loc_data& loc_data) {
  ConfigProtocol config_protocol;

  /* Parse configuration protocol root node */
  pugi::xml_node xml_config = get_single_child(Node, "configuration_protocol", loc_data);

  pugi::xml_node xml_config_orgz = get_single_child(xml_config, "organization", loc_data);
  read_xml_config_organization(xml_config_orgz, loc_data, config_protocol);

  return config_protocol;
}

