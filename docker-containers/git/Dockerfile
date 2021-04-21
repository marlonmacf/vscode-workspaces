FROM alpine:latest

COPY id_rsa /root/.ssh/id_rsa
COPY id_rsa.pub /root/.ssh/id_rsa.pub

RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa.pub

RUN apk add --no-cache --update git
RUN apk add --no-cache --update openssh-keygen
RUN apk add --no-cache --update openssh-client

RUN git config --global push.default matching
RUN git config --global credential.helper store

RUN git config --global user.email "marlonmacf@gmail.com"
RUN git config --global user.name "Marlon Freitas"

RUN ssh-keyscan github.com > /root/.ssh/known_hosts

# ssh-keygen -m PEM -t rsa -P ""
# eval $(ssh-agent -s)
# ssh-add /root/.ssh/id_rsa
# cat /root/.ssh/id_rsa
# cat /root/.ssh/id_rsa.pub