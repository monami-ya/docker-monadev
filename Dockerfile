FROM monami0ya/docker-baseimage:monadev
MAINTAINER Masaki Muranaka "https://github.com/monaka"

RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update

RUN apt-get install -y openssh-server eclipse xvfb wget \
  xbase-clients python-psutil libpango1.0-0 libxss1 \
  zip unzip eclipse maven git tmux
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y dnsutils
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
RUN dpkg -i chrome-remote-desktop_current_amd64.deb && rm chrome-remote-desktop_current_amd64.deb

RUN echo 'root:root' |chpasswd

RUN addgroup --gid 1000 monaka
RUN adduser --uid 1000 --gid 1000 --shell /bin/bash monaka
RUN echo 'monaka ALL=NOPASSWD: ALL' > /etc/sudoers.d/monaka

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config
#RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22 443

RUN apt-get install -y vim 
