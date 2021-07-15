cmake_minimum_required(VERSION 2.8.12)

find_program(CCACHE_FOUND ccache)
if(CCACHE_FOUND)
        set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
        set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
endif(CCACHE_FOUND)

if (${CMAKE_VERSION} VERSION_GREATER "3.8")
    #For cmake >= 3.9 INTERPROCEDURAL_OPTIMIZATION behaviour we need to explicitly
    #set the cmake policy version number
    cmake_policy(VERSION 3.9) 

    # If we are using verison < 3.9 then setting INTERPROCEDURAL_OPTIMIZATION
    # has no effect unless an Intel compiler is used
endif()

# Set the default build type if not specified
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING
        "Choose the type of build: None, Debug, Release, RelWithDebInfo, MinSizeRel"
        FORCE)
endif()
message(STATUS "CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    message("CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")
    message("CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "In-source builds not allowed. Use the Makefile wrapper (e.g. make), or create a new build directory and call cmake manually from there (e.g. mkdir -p build && cd build && cmake .. && make). You may need to 'rm -rf CMakeCache.txt CMakeFiles' first.")
endif()

#We install to the source directory by default
if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set (CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}" CACHE PATH "default install path" FORCE)
endif()

#Allow the user to configure how much assertion checking should occur
set(VTR_ASSERT_LEVEL "2" CACHE STRING "VTR assertion checking level. 0: no assertions, 1: fast assertions, 2: regular assertions, 3: additional assertions with noticable run-time overhead, 4: all assertions (including those with significant run-time cost)")
set_property(CACHE VTR_ASSERT_LEVEL PROPERTY STRINGS 0 1 2 3 4)

#Create the project 
project("OPENFPGA" C CXX)

# Options
# Option to enable/disable graphic in compilation
option(ENABLE_VPR_GRAPHICS "Enables VPR graphics" ON)
option(ENABLE_VPR_GRAPHICS "Enables build with librtlnumber" OFF)

#Allow the user to decide weather to compile the graphics library
set(VPR_USE_EZGL "auto" CACHE STRING "Specify whether vpr uses the graphics library")
set_property(CACHE VPR_USE_EZGL PROPERTY STRINGS auto off on)

# Version number
set(OPENFPGA_VERSION_MAJOR 1)
set(OPENFPGA_VERSION_MINOR 0)
set(OPENFPGA_VERSION_PATCH 0)
set(OPENFPGA_VERSION_PRERELEASE "dev")

# Include user-defined functions
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules)
include(FilesToDirs)

# Set the assertion level
add_definitions("-DVTR_ASSERT_LEVEL=${VTR_ASSERT_LEVEL}")

# compiler flag configuration checks
include(CheckCXXCompilerFlag)

#
# We require c++14 support
#
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF) #No compiler specific extensions


# Set WARN FLAGS
set(WARN_FLAGS "")

if (MSVC)
  # Visual studio warnings 
  # Note that we do not use /Wall since it generates warnings about standard library headers
  set(WARN_FLAGS_TO_CHECK # the flags to check if the compiler supports
      "/W4" # Most warnings
     )
else ()
  set(WARN_FLAGS_TO_CHECK # the flags to check if the compiler supports
      #GCC-like
      "-Wpointer-arith"
      "-Wcast-qual"
      "-D__USE_FIXED_PROTOTYPES__"
      "-ansi"
      "-Wshadow"
      "-Wno-write-strings"
      "-D_POSIX_SOURCE"
      "-Wall"                         #Most warnings, typically good
      "-Wextra"                       #Extra warning, usually good
      "-Wpedantic"                    #Ensure ISO compliance (i.e. no non-standard extensions)
      "-Wcast-qual"                   #Warn if cast removes qualifier (e.g. const char* -> char*)
      "-Wcast-align"                  #Warn if a cast causes memory alignment changes
      "-Wshadow"                      #Warn if local variable shadows another variable
      "-Wformat=2"                    #Sanity checks for printf-like formatting
      "-Wno-format-nonliteral"        # But don't worry about non-literal formtting (i.e. run-time printf format strings)
      "-Wlogical-op"                  #Checks for logical op when bit-wise expected
      "-Wmissing-declarations"        #Warn if a global function is defined with no declaration
      "-Wmissing-include-dirs"        #Warn if a user include directory is missing
      "-Wredundant-decls"             #Warn if there are overlapping declarations
      "-Wswitch-default"              #Warn if a switch has no default
      "-Wundef"                       #Warn if #if() preprocessor refers to an undefined directive
      "-Wunused"                      #Warn about unused variables/parameters
      "-Wunused-variable"             #Warn about variables that are not used
      "-Wunused-parameter"            #Warn about function parameters which are unused
      "-Wdisabled-optimization"       #Warn when optimizations are skipped (usually due to large/complex code)
      "-Wnoexcept"                    #Warn when functions should be noexcept (i.e. compiler know it doesn't throw)
      "-Woverloaded-virtual"          #Warn when a function declaration overrides a virtual method
      "-Wctor-dtor-privacy"           #Warn about inaccessible constructors/destructors
      "-Wnon-virtual-dtor"            #Warn about missing virtual destructors
      "-Wduplicated-cond"             #Warn about identical conditions in if-else chains
      "-Wduplicated-branches"         #Warn when different branches of an if-else chain are equivalent
      "-Wnull-dereference"            #Warn about null pointer dereference execution paths
      "-Wuninitialized"               #Warn about unitialized values
      "-Winit-self"                   #Warn about self-initialization
      "-Wcatch-value=3"               #Warn when catch statements don't catch by reference
"-Wextra-semi" #Warn about redudnant semicolons
      )
endif()

# check and see if the compiler supports the various warning flags
# and add valid flags
foreach (flag ${WARN_FLAGS_TO_CHECK})
  CHECK_CXX_COMPILER_FLAG(${flag} CXX_COMPILER_SUPPORTS_${flag})
  if (CXX_COMPILER_SUPPORTS_${flag})
    # flag supported, so enable it
    set (WARN_FLAGS "${WARN_FLAGS} ${flag}")
  endif()
endforeach()
#
# Sanitizer flags
#

set(SANITIZE_FLAGS "")
if(OPENFPGA_ENABLE_SANITIZE)
    #Enable sanitizers
    # -fuse-ld=gold force the gold linker to be used (required for sanitizers, but not enabled by default on some systems)
    set(SANITIZE_FLAGS "-g -fsanitize=address -fsanitize=leak -fsanitize=undefined -fuse-ld=gold")
    message(STATUS "SANTIIZE_FLAGS: ${SANITIZE_FLAGS}")
    link_libraries("-static-libasan") #Fixes 'ASan runtime does not come first in initial library list'
endif()

# Set final flags
#
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${WARN_FLAGS} ${SANITIZE_FLAGS}")
message(STATUS "CMAKE_CXX_FLAGS: ${CMAKE_CXX_FLAGS}")


# Unit Testing
#
enable_testing()

# set VPR_USE_EZGL in the root of VTR to decide whether to add
# subdirectory of graphics library, which prevents users
# without gtk/x11 libraries installed to build. VPR_USE_EZGL is
# being used in both the vpr CMakeLists and libs/EXTERNAL CMakeLists.
#
# check if GTK and X11 are installed and turn on/off graphics
if (VPR_USE_EZGL STREQUAL "auto")
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(GTK3 QUIET gtk+-3.0)
    pkg_check_modules(X11 QUIET x11)

    if(GTK3_FOUND AND X11_FOUND)
        set(VPR_USE_EZGL "on")
        message(STATUS "VPR Graphics: Enabled")
    else()
        set(VPR_USE_EZGL "off")
        message(STATUS "VPR Graphics: Disabled (required libraries missing, on debia/ubuntu try: sudo apt install libgtk-3 libx11-dev")
    endif()
endif()


# 
# Sub-projects
#
#add_subdirectory(iverilog)
add_subdirectory(libs)
add_subdirectory(libopenfpga)
#add_subdirectory(yosys)
add_subdirectory(abc)
add_subdirectory(ace2)
add_subdirectory(vpr)
add_subdirectory(openfpga)

# yosys compilation starts

# Compilation options for yosys
include(CMakeParseArguments)

##project(yosys)

# Options to enable/disable dependencies
option(YOSYS_ENABLE_TCL, "Enable TCL parser integrated in yosys" ON)
option(YOSYS_ENABLE_ABC, "Enable ABC library integrated in yosys" ON)
option(YOSYS_ENABLE_PLUGINS, "Enable plug-in in yosys" ON)
option(YOSYS_ENABLE_READLINE, "Enable readline library in yosys" ON)
option(YOSYS_ENABLE_VERIFIC, "Enable verification library in yosys" OFF)
option(YOSYS_ENABLE_COVER, "Enable coverage test in yosys" ON)
option(YOSYS_ENABLE_LIBYOSYS, "Enable static library compiled yosys" OFF)
option(YOSYS_ENABLE_GPROF, "Enable profiling in compiled yosys" OFF)
option(YOSYS_ENABLE_NDEBUG, "Enable non-debugging feature in compiled yosys" OFF)

#
## Search and link dependent packages
## We need readline to compile 
if (YOSYS_ENABLE_READLINE)
  find_package(Readline REQUIRED)
endif()

#
#########################
##                      #
## Compiler Flags Setup #
##                      #
#########################
#
## Compiler flag configuration checks
include(CheckCCompilerFlag)
include(CheckCXXCompilerFlag)
#

# run makefile provided, we pass-on the options to the local make file 
add_custom_target(
    yosys ALL 
    COMMAND rm -rf ${CMAKE_CURRENT_SOURCE_DIR}/yosys/install
    COMMAND $(MAKE) config-gcc
    COMMAND $(MAKE) install PREFIX=${CMAKE_CURRENT_SOURCE_DIR}/yosys/install
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/yosys
    COMMENT "Compile Yosys with given Makefile"
)

# yosys compilation ends

# yosys-plugins compilation starts
add_custom_target(
    yosys-plugins ALL 
    COMMAND $(MAKE) 
    COMMAND $(MAKE) install 
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/yosys-plugins
    COMMENT "Compile Yosys-plugins with given Makefile"
)

add_dependencies(yosys-plugins yosys) 

# yosys-plugins compilation ends

# run make to extract compiler options, linker options and list of source files
#add_custom_target(
#  yosys
#  COMMAND make run
#  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/yosys
#)

# Add extra compilation flags to suppress warnings from some libraries/tools
# Note that target_compile_options() *appends* to the current compilation options of
# the specified target

#Since ABC is an externally developed tool, we suppress all compiler warnings
CHECK_CXX_COMPILER_FLAG("-w" CXX_COMPILER_SUPPORTS_-w)
if(CXX_COMPILER_SUPPORTS_-w)
    target_compile_options(libabc PRIVATE "-w")
    target_compile_options(abc PRIVATE "-w")
endif()

#Some ABC headers generate warnings, treat them as system headers to suppress warnings
get_property(ABC_INCLUDE_DIRS TARGET libabc PROPERTY INCLUDE_DIRECTORIES)
target_include_directories(libabc SYSTEM INTERFACE ${ABC_INCLUDE_DIRS})

# We use Yosys and abc Makefile now, TODO: create CMakeLists.txt as well
set_target_properties(libabc abc
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/abc"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/abc"
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/abc")

# Set output locations to be in the main source tree under the relevant folder
set_target_properties(libace ace
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/ace2"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/ace2"
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/ace2")

set_target_properties(libvpr vpr
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/vpr"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/vpr"
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/vpr")

set_target_properties(libopenfpga openfpga
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/openfpga"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/openfpga"
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/openfpga")
