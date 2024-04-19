LABEL org.opencontainers.image.source = "https://github.com/TheDevtop/podmacs"
LABEL org.opencontainers.image.description = "Some programming environment"
FROM debian:bookworm-slim
RUN apt update && apt install mit-scheme -y && apt clean
COPY tty2web /usr/local/bin/tty2web
COPY dot.tty2web /root/.tty2web
ENV HOME=/root
ENV TERM=xterm
ENV TTY2WEB_TERM=hterm
EXPOSE 8080/tcp
WORKDIR /root
VOLUME /root/
CMD ["/usr/local/bin/tty2web", "/usr/bin/scheme", "-edit"]
