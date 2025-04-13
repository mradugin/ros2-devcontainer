FROM --platform=linux/${TARGETARCH} ros:jazzy-ros-base

ARG USERNAME=rosuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Delete user if it exists in container (e.g Ubuntu Noble: ubuntu)
RUN if id -u $USER_UID; then userdel `id -un $USER_UID`; fi

# Create the user
RUN \
  groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Install sudo and add user to sudoers
RUN apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

# Install dependencies and some tools
RUN \
  --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  apt-get update \
  && apt-get upgrade -y \
  && apt-get install --no-install-recommends -y \
    ssh git bash ccache htop gdb wget curl \
    python3 python3-pip python3-venv python3-debugpy

# Source ROS environment automatically
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash # ROS_SETUP_SCRIPT" >> /home/$USERNAME/.bashrc

ENV SHELL=/bin/bash
USER $USERNAME

CMD ["/bin/bash"]
