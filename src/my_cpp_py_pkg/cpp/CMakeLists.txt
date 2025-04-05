find_package(rclcpp REQUIRED)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(MY_CPP_NODE_EXAMPLE_FLAG)
  message(STATUS "MY_CPP_NODE_EXAMPLE_FLAG is ON")
else()
  message(STATUS "MY_CPP_NODE_EXAMPLE_FLAG is OFF")
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

add_subdirectory(cpp_lib)
add_subdirectory(cpp_node)
