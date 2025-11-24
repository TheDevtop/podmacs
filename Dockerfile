FROM alpine:3.22

RUN apk update && apk add emacs-nox openssh-server
RUN echo '/usr/local/bin/elogin' >> /etc/shells
RUN passwd -d root

COPY sshd_config /etc/ssh/sshd_config
COPY passwd /etc/passwd
COPY elogin.sh /usr/local/bin/elogin
COPY estart.sh /usr/local/bin/estart
RUN chmod a+x /usr/local/bin/estart
RUN chmod a+x /usr/local/bin/elogin
RUN ssh-keygen -A

WORKDIR /root
VOLUME [ "/root" ]
EXPOSE 22
ENTRYPOINT [ "/usr/local/bin/estart" ]
LABEL org.opencontainers.image.source "https://github.com/TheDevtop/podmacs"
