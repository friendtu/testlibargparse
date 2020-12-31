cmake_minimum_required(VERSION 3.9)

project("testlibargparse")

#build it
add_executable(add add.cpp)
target_link_libraries(add PUBLIC argparse)

#Run testing as an example
enable_testing()
add_test(NAME simple COMMAND add 1 1)
set_tests_properties(simple PROPERTIES PASS_REGULAR_EXPRESSION "result: 2")

#Install to /usr/local/bin
install(TARGETS add DESTINATION bin)
