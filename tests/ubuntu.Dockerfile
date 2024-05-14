FROM ubuntu:latest
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
    sudo curl
RUN useradd -ms /bin/bash ubuntu && \
    usermod -aG sudo ubuntu
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ubuntu
WORKDIR /home/ubuntu
CMD ["/bin/bash"]