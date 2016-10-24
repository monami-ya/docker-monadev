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

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed -ri 's/^#?PasswordAuthentication\s+.*/PasswordAuthentication no/' /etc/ssh/sshd_config
#RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

RUN mkdir /etc/service/x11vnc
ADD x11vnc.sh /etc/service/x11vnc/run

RUN mkdir /etc/service/xvfb
ADD xvfb.sh /etc/service/xvfb/run

RUN apt-get install -y vim x11vnc xvfb awesome traceroute man \
  xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic sakura
RUN ln -sf /var/host/media/removable/ /media/removable

RUN apt-get install ttf-kochi-gothic xfonts-intl-japanese xfonts-intl-japanese-big
