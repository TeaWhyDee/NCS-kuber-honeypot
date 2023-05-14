FROM ubuntu
 
WORKDIR /mysql
COPY ./docker-mount-dir /mysql

EXPOSE 3306
 
RUN mkdir /run/mysql-honeypotd
RUN apt update
RUN apt install libev-dev -y
 
CMD ["./mysql-honeypotd", "-s", "5.6", "-n", "mysql-replica", "-f"]
