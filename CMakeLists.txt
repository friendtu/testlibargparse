cmake_minimum_required(VERSION 3.9)

project("testlibargparse")

#[[
if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_CURRENT_SOURCE_DIR})
    #Only set compiler settings if we are not a sub-project
    set(WARN_FLAGS "-Wall -Wextra -Wpedantic -Wcast-qual -Wcast-align -Wshadow -Wformat=2 -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wredundant-decls -Wswitch-default -Wundef -Wunused-variable -Wdisabled-optimization -Wnoexcept -Woverloaded-virtual -Wctor-dtor-privacy -Wnon-virtual-dtor")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --std=c++14 ${WARN_FLAGS}") 
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address -fsanitize=leak -fsanitize=undefined") 
    set(FLEX_BISON_WARN_SUPPRESS_FLAGS "-Wno-switch-default -Wno-unused-parameter -Wno-missing-declarations")

    #using an environment variable to identify the place of lib so multi-version can be used in one machine
    link_directories($ENV{THIRDPARTY}/lib)
    include_directories($ENV{THIRDPARTY}/header)
endif()
]]


#if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_CURRENT_SOURCE_DIR})
    #Create the test executable
    #add_executable(argparse_test argparse_test.cpp)
    #target_link_libraries(argparse_test libargparse)

    #Create the example executable
    add_executable(add add.cpp)
    target_link_libraries(add PUBLIC argparse)
#endif()

#Run testing as an example
enable_testing()
add_test(NAME simple COMMAND add 1 1)
set_tests_properties(simple PROPERTIES PASS_REGULAR_EXPRESSION "result: 2")
#Install to /usr/local/bin
install(TARGETS add DESTINATION bin)
