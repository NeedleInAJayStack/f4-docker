FROM eclipse-temurin:8-jdk-jammy

RUN apt-get update && apt-get install -y sudo zip libgtk-3-0 libcanberra-gtk-module openssh-server && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/xored/f4/releases/download/v1.1.6/f4-1.1.6-linux-gtk-x86_64.zip -O /tmp/f4.zip -q && \
    unzip /tmp/f4.zip -d /opt && \
    rm /tmp/f4.zip && \
    chmod +x /opt/f4/F4

RUN useradd --user-group --create-home --system --skel /dev/null f4
USER f4

WORKDIR /home/f4
RUN mkdir /home/f4/f4workspace && \
    mkdir /home/f4/interpreters && \
    mkdir /home/f4/.eclipse

VOLUME /home/f4/f4workspace
VOLUME /home/f4/interpreters
VOLUME /home/f4/.eclipse

ENTRYPOINT /opt/f4/F4