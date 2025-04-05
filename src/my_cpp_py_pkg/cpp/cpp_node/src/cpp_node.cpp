#include <stdio.h>

#include "rclcpp/rclcpp.hpp"

#include "cpp_lib.h"

#include "minimal_sub.hpp"

int main(int argc, char* argv[])
{
    cpp_lib_hello();

    rclcpp::init(argc, argv);

    rclcpp::spin(std::make_shared<MinimalSubscriber>(std::vector<std::string>{"topic1", "topic2"}));
    rclcpp::shutdown();
    return 0;
}
