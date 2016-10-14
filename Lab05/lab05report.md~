### A Basic Starting Point (Step1): 
# 1
### CMakeLists.txt
cmake_minimum_required (VERSION 2.6)
project (Tutorial)
# The version number.
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)
 
# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
  "${PROJECT_BINARY_DIR}/TutorialConfig.h"
  )
 
# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories("${PROJECT_BINARY_DIR}")
 
# add the executable
add_executable(Tutorial tutorial.cxx)

#### cmake .
rpi-wl-1035:Lab05 hassanalshehri$ cmake .
-- The C compiler identification is AppleClang 8.0.0.8000038
-- The CXX compiler identification is AppleClang 8.0.0.8000038
-- Check for working C compiler: /Library/Developer/CommandLineTools/usr/bin/cc
-- Check for working C compiler: /Library/Developer/CommandLineTools/usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /Library/Developer/CommandLineTools/usr/bin/c++
-- Check for working CXX compiler: /Library/Developer/CommandLineTools/usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /Users/hassanalshehri/Google Drive/RPI/Open_Software/myRepo/Lab05

### make 
rpi-wl-1035:Lab05 hassanalshehri$ make 
Scanning dependencies of target Tutorial
[ 50%] Building C object CMakeFiles/Tutorial.dir/tutorial.c.o
[100%] Linking C executable Tutorial
[100%] Built target Tutorial

--------------------
#2
#### CMakeLists.txt
cmake_minimum_required (VERSION 2.6)
project (Tutorial)
# The version number.
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

# should we use our own math functions?
option (USE_MYMATH
        "Use tutorial provided math implementation" ON)

# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
  "${PROJECT_BINARY_DIR}/TutorialConfig.h"
  )

# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories("${PROJECT_BINARY_DIR}")

include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
add_subdirectory (MathFunctions)

# add the MathFunctions library?
#
if (USE_MYMATH)
  include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
  add_subdirectory (MathFunctions)
  set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif (USE_MYMATH)

# add the executable
add_executable (Tutorial tutorial.c)
target_link_libraries (Tutorial  ${EXTRA_LIBS})

### Adding a Library (Step 2) 

rpi-wl-1035:Lab05 hassanalshehri$ cmake .
-- Configuring done
-- Generating done
-- Build files have been written to: /Users/hassanalshehri/Google Drive/RPI/Open_Software/myRepo/Lab05
rpi-wl-1035:Lab05 hassanalshehri$ 
rpi-wl-1035:Lab05 hassanalshehri$ 
rpi-wl-1035:Lab05 hassanalshehri$ make
Scanning dependencies of target Tutorial
[ 50%] Building C object CMakeFiles/Tutorial.dir/tutorial.c.o
[100%] Linking C executable Tutorial
[100%] Built target Tutorial
-------------------------------------
#3
### CMakeLists.txt
cmake_minimum_required (VERSION 2.6)
project (Tutorial)
# The version number.
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

# should we use our own math functions?
option (USE_MYMATH 
        "Use tutorial provided math implementation" ON) 
 
# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
  "${PROJECT_BINARY_DIR}/TutorialConfig.h"
  )
 
# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories("${PROJECT_BINARY_DIR}")

include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
add_subdirectory (MathFunctions)

# add the MathFunctions library?
#
if (USE_MYMATH)
  include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
  add_subdirectory (MathFunctions)
  set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif (USE_MYMATH)
  
# add the executable
add_executable (Tutorial tutorial.c)
target_link_libraries (Tutorial  ${EXTRA_LIBS})

# add the install targets
install (TARGETS Tutorial DESTINATION bin)
install (FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"        
         DESTINATION include)


include(CTest)
 
 
# does the application run add_test (TutorialRuns Tutorial 25) # does it sqrt of 25 add_test (TutorialComp25 Tutorial 25) set_tests_properties (TutorialComp25 PROPERTIES PASS_REGULAR_EXPRESSION “25 is 5”) # does it handle negative numbers add_test (TutorialNegative Tutorial -25) set_tests_properties (TutorialNegative PROPERTIES PASS_REGULAR_EXPRESSION “-25 is 0”) # does it handle small numbers add_test (TutorialSmall Tutorial 0.0001) set_tests_properties (TutorialSmall PROPERTIES PASS_REGULAR_EXPRESSION “0.0001 is 0.01”) # does the usage message work? add_test (TutorialUsage Tutorial) set_tests_properties (TutorialUsage PROPERTIES PASS_REGULAR_EXPRESSION “Usage:.*number”)
