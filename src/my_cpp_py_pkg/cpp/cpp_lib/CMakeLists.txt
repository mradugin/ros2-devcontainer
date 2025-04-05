project(cpp_lib)

add_library(${PROJECT_NAME} src/cpp_lib.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC include)

