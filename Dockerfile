FROM alpine:latest
MAINTAINER Mark Bryan<mark.bryan@cgi.com>

#small alpine template

#because apt needs to know its not a real terminal 
#RUN export DEBIAN_FRONTEND=noninteractive
#ENV DEBIAN_FRONTEND noninteractive
#RUN dpkg-divert --local --rename --add /sbin/initctl

RUN apk update
RUN apk add ansible
RUN mkdir -p /usr/local/source/ansible
ADD playbook.yml /usr/local/source/ansible/playbook.yml 
ADD template-role /usr/local/source/ansible/template-role
ADD hosts /usr/local/source/ansible/hosts

RUN ansible-playbook -i /usr/local/source/ansible/hosts /usr/local/source/ansible/playbook.yml


CMD echo "Beach the whales"
