FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install openssh-client ansible git sshpass python3 python3-flask make
COPY . /ansible

COPY known_hosts /root/.ssh/known_hosts

WORKDIR /ansible


EXPOSE 80
CMD [ "ansible-playbook", "-i", "servers.yml", "deploy.yml" ]