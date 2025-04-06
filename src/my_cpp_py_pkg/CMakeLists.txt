cmake_minimum_required(VERSION 3.5)
project(my_cpp_py_pkg)

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_python REQUIRED)

add_subdirectory(cpp)
add_subdirectory(python)

install(DIRECTORY launch
  DESTINATION share/${PROJECT_NAME})

ament_package()
