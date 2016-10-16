FROM monami0ya/docker-baseimage:monadev
MAINTAINER Masaki Muranaka "https://github.com/monaka"

RUN apt-get update

RUN apt-get install -y openssh-server eclipse xvfb wget \
  xbase-clients python-psutil libpango1.0-0 libxss1 \
  zip unzip eclipse maven git
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
RUN dpkg -i chrome-remote-desktop_current_amd64.deb && rm chrome-remote-desktop_current_amd64.deb

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config
#RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22 443

