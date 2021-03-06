FROM ubuntu:19.10
LABEL maintainer="minikspb@gmail.com"

RUN dpkg --add-architecture i386
RUN apt-get update

# Download specific Android Studio bundle (all packages).
RUN apt-get install -y curl unzip

RUN curl 'https://uit.fun/repo/android-studio-ide-3.6.3-linux.tar.gz' > /studio.tar.gz && \
  tar -zxvf studio.tar.gz && rm /studio.tar.gz

# Install X11
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y xorg


# Install other useful tools
RUN apt-get install -y vim ant

# install Java
RUN apt-get install -y default-jdk

# Install prerequisites
RUN apt-get install -y libz1 libncurses5 libbz2-1.0:i386 libstdc++6 libbz2-1.0 lib32stdc++6 lib32z1


# Clean up
RUN apt-get clean
RUN apt-get purge

