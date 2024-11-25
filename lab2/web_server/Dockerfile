FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
       apt-get -y install git && \
       apt-get -y install gcc make && \
       apt-get -y install libpcre3-dev zlib1g-dev && \
       apt-get -y install openssh-server

WORKDIR /server
RUN ["git", "clone", "https://github.com/nginx/nginx.git", "--depth", "1", "/server/nginx"]
WORKDIR /server/nginx

RUN ["./auto/configure", "--without-http_rewrite_module"]
RUN make

RUN apt-get -y install python3
RUN apt-get -y install python3-flask
COPY web_server.py /server/web_server.py
COPY start_ssh_server.sh /server/
# COPY nginx.conf /usr/local/nginx/conf/nginx.conf
COPY sshd_config /etc/ssh/sshd_config


RUN echo "docker\ndocker" | passwd

EXPOSE 22
# EXPOSE 80
CMD ["/server/start_ssh_server.sh"] 


