#!/usr/bin/env python3

import rclpy
import node2_package.module
import shared_package.minimal_pub

def main(args=None):
    node2_package.module.func()

    rclpy.init(args=args)
    minimal_publisher = shared_package.minimal_pub.MinimalPublisher('topic2')
    rclpy.spin(minimal_publisher)
    minimal_publisher.destroy_node()
    rclpy.shutdown()

if __name__ == "__main__":
    main() 
