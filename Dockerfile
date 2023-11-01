FROM eclipse-temurin:8-jdk-jammy

RUN apt-get update && apt-get install -y sudo zip libgtk-3-0 libcanberra-gtk-module openssh-server && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/xored/f4/releases/download/v1.1.6/f4-1.1.6-linux-gtk-x86_64.zip -O /tmp/f4.zip -q && \
    unzip /tmp/f4.zip -d /opt && \
    rm /tmp/f4.zip && \
    chmod +x /opt/f4/F4

WORKDIR /root/f4
RUN mkdir /root/interpreters && \
    mkdir /root/.eclipse

# f4workspace is created automatically by f4 install
VOLUME /root/f4workspace
VOLUME /root/interpreters
VOLUME /root/.eclipse

ENTRYPOINT /opt/f4/F4
