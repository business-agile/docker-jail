# docker-jail
A jail for your ssh users

## How to install (for debian based distro)

* Pull the jail docker image :
  ```docker pull saddokm/docker-jail:0.1```
* Add sshjailed group
  ```addgroup sshjailed```
* Prepare your sshd_config
  ```
  Match Group sshjailed
        X11Forwarding no
        AllowTcpForwarding no
        ForceCommand docker run --rm -ti -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v $HOME:$HOME --workdir $HOME --hostname $HOSTNAME -u $( id -u $USER ):$( id -g $USER )  saddokm/docker-jail:0.1 bash
  ```
* Restart openssh :
  ```service ssh restart```
* Add an user which is in docker and sshjailed group :
  ```
  adduser prisoner
  usermod -aG sshjailed docker
  ```
* Test it :
  ```ssh prisoner@host```

 Voilà !
