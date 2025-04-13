# ROS2 Development Container

This repository contains a development container workspace setup for ROS2 development. It provides a convenient environment for running and debugging ROS2 nodes written in both C++ and Python.

Current workspace works out of the box in Visual Studio Code running on **Windows**, **macOS** and **Linux**.

## Features

- Pre-configured development environment for ROS2
- Support for both C++ and Python development
- Integrated debugging capabilities
- Containerized development environment for consistent builds

## Getting Started

1. Make sure you have Docker and VS Code with the Remote - Containers extension installed
2. Clone this repository
3. Open the repository in VS Code
4. When prompted, click "Reopen in Container"

The development container will be built, and you'll have a fully configured ROS2 development environment ready to use.

## Build System

The build process is managed by the ROS2 build system (colcon) for both C++ and Python nodes. Colcon uses CMake under the hood, with all compilation and installation steps described in corresponding CMakeLists.txt files throughout the package.

### Building and Installing

The package can be built and installed by running the `scripts/build.sh` script or by running the `Build Task` in Visual Studio Code.   
The build process will:
- Build C++ nodes and their dependencies
- Install C++ and Python nodes along with their dependencies to the `install` directory

### Optimizations

The build process includes the following optimizations to minimize build times during development:
- Gold linker for faster linking
- ccache for caching and reusing compilation results
- Symlink installation for Python files to avoid copying

## Development

### Directory Structure

For convenience, C++ and Python nodes are split into distinct subdirectories, with the CMakeLists.txt in the package directory including both of them.

```
.
├── src/                   # Source code directory
│   └── my_cpp_py_pkg/     # ROS2 package containing both C++ and Python nodes
│       ├── cpp/           # C++ nodes and dependencies
│       ├── python/        # Python nodes and modules
│       ├── launch/        # Launch files for running nodes
│       ├── CMakeLists.txt # CMake configuration for the package
│       └── package.xml    # Package manifest file
```

### Code Completion

Code completion and IntelliSense are already configured to include:
- C++ ROS2 and system include paths
- Python ROS2 packages
- Package's C++ and Python sources

### C++

The current setup allows adding dependencies using CMake's `find_module()` and colcon's `ament_target_dependencies()` as well as `add_subdirectory()` and `target_link_libraries()` commands. See [cpp_node](src/my_cpp_py_pkg/cpp/cpp_node/CMakeLists.txt) for details.
Dependencies can be built within the same package. See [cpp_lib](src/my_cpp_py_pkg/cpp/cpp_lib/CMakeLists.txt) as an example.

### Python

Python nodes and their packages reside in the `python` folder. Each node has a main executable file and related packages. For example, `py_node1` has [py_node1.py](src/my_cpp_py_pkg/python/py_node1/py_node1.py) as its main executable and [node1_package](src/my_cpp_py_pkg/python/py_node1/node1_package/module.py) as its package. Both are installed by the corresponding [CMakeLists.txt](src/my_cpp_py_pkg/python/py_node1/CMakeLists.txt).

Packages that are shared between multiple nodes reside in the `share` folder and are managed by [CMakeLists.txt](src/my_cpp_py_pkg/python/share/CMakeLists.txt).

Make sure that your Python package names are unique, as colcon's `ament_python_install_package()` command installs all packages into the same `site-packages` directory.

## Running and Debugging

The workspace supports convenient node execution via launch files and debugging capabilities for both C++ and Python nodes.

Select and launch the `ROS: Launch` debug configuration to launch nodes defined in `src/my_cpp_py_pkg/launch/default.xml`. 
You can set breakpoints in your code and simultaneously debug **ALL** C++ and Python nodes using VS Code's debugging features.
