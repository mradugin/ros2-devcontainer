# Install Python modules
ament_python_install_package(node2_package)

# Install Python executables
install(PROGRAMS
  py_node2.py
  DESTINATION lib/${CMAKE_PROJECT_NAME}
)
