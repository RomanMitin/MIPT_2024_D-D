FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install openssh-server

COPY web_server.py /server/web_server.py
COPY start_ssh_server.sh /server/

COPY sshd_config /etc/ssh/sshd_config

RUN echo "docker\ndocker" | passwd

EXPOSE 22
EXPOSE 80

CMD ["/server/start_ssh_server.sh"] 


