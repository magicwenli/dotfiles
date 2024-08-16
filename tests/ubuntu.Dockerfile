FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
    sudo curl git fish
RUN useradd -ms /bin/fish vita && \
    usermod -aG sudo vita
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER vita
WORKDIR /home/vita
CMD ["/bin/fish"]