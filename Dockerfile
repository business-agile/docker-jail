FROM debian:jessie-slim

RUN DEBIAN_FRONTEND=noninteractive apt update
RUN DEBIAN_FRONTEND=noninteractive apt install --force-yes -y git curl php5-cli openssh-sftp-server
