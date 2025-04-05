project(cpp_node)

find_package(std_msgs REQUIRED)
find_package(rclcpp REQUIRED)

add_executable(${PROJECT_NAME} src/cpp_node.cpp)

target_include_directories(${PROJECT_NAME} PRIVATE include)

target_link_libraries(${PROJECT_NAME} cpp_lib)

ament_target_dependencies(${PROJECT_NAME} rclcpp std_msgs)

install(TARGETS
  ${PROJECT_NAME}
  DESTINATION lib/${CMAKE_PROJECT_NAME}
)
