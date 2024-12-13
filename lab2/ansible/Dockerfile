FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install openssh-client ansible sshpass
COPY . /ansible

COPY known_hosts /root/.ssh/known_hosts

WORKDIR /ansible

# CMD ansible -i servers.yml -m ping all -v
CMD ansible-playbook -i servers.yml deploy.yml
# CMD sleep 1000
