# FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04
# FROM kaggle/python:latest

# us-docker.pkg.dev/colab-images/public/runtime:latest 

FROM europe-docker.pkg.dev/colab-images/public/runtime:latest

# RUN pip3 install cuda-python==11.8.0
# RUN apt-get update && apt-get install -y python3-pip \
#   && pip3 install \
#     nvidia-cudnn-cu11==8.6.0.163 \
#     tensorflow==2.12.0 \
#     matplotlib \
#     tensorflow-datasets==4.9.2 \
#     ipywidgets==7.7.1 \
#     numpy 


ARG USERNAME=zero
ARG USER_UID=1000
ARG USER_GID=$USER_UID
# ENV ROS_DISTRO=python


RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

