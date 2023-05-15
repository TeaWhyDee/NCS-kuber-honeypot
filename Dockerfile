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
RUN python3 -m pip install requests
 
CMD /bin/bash -c "././mysql-honeypotd -s 5.6 -n mysql-replica -f | python3 catch_log.py"
