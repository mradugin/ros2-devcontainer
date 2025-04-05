#pragma once

#include <memory>
#include <vector>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

class MinimalSubscriber : public rclcpp::Node
{
public:
  MinimalSubscriber(const std::vector<std::string>& topics)
  : Node("minimal_subscriber")
  {
    for (const auto& topic: topics)
    {
      this->subscriptions_.emplace_back(this->create_subscription<std_msgs::msg::String>(
        topic, 10, std::bind(&MinimalSubscriber::topic_callback, this, std::placeholders::_1)));
    }
  }

private:
  void topic_callback(const std_msgs::msg::String::SharedPtr msg) const
  {
    RCLCPP_INFO(this->get_logger(), "I heard: '%s'", msg->data.c_str());
  }
  std::vector<rclcpp::Subscription<std_msgs::msg::String>::SharedPtr> subscriptions_;
};
