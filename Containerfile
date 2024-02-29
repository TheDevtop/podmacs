LABEL org.opencontainers.image.source = "https://github.com/TheDevtop/podmacs"
LABEL org.opencontainers.image.description = "Containerized Emacs"
FROM alpine:edge
RUN apk add emacs-nox
COPY tty2web /usr/bin/tty2web
COPY dot.tty2web /root/.tty2web
COPY init.el /root/.emacs.d/init.el
ENV HOME=/root
ENV TERM=xterm
ENV TTY2WEB_TERM=hterm
EXPOSE 8079/tcp
WORKDIR /root
VOLUME /root/
CMD ["/usr/bin/tty2web", "/usr/bin/emacs"]
