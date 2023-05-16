FROM ubuntu
 
WORKDIR /mysql
COPY ./docker-mount-dir /mysql
COPY ./catch_log.py /mysql

EXPOSE 3306
 
RUN mkdir /run/mysql-honeypotd
RUN apt update
RUN apt install libev-dev -y
RUN apt install python3 -y
RUN apt -y install python3-pip
RUN apt -y install gawk
RUN apt -y install curl
RUN python3 -m pip install requests
 
# CMD /bin/bash -c "./mysql-honeypotd -s 5.6 -n mysql-honeypot -f 2>&1 | gawk '{print; fflush()}' | xargs -I '{}' python3 catch_log.py '{}'"
CMD /bin/bash -c "./mysql-honeypotd -s 5.6 -n mysql-honeypot -f 2>&1 | gawk '{print; fflush()}' | xargs -I '{}' curl -u p0g8rnvep8u3p2ed:'ItLS1}ReT#f_DvR1/Ot|' -d '{}' https://ntfy.teawide.xyz/ncs"
