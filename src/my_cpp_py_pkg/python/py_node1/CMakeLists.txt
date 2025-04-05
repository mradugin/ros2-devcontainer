# Install Python modules
ament_python_install_package(node1_package)

# Install Python executables
install(PROGRAMS
  py_node1.py
  DESTINATION lib/${CMAKE_PROJECT_NAME}
)
