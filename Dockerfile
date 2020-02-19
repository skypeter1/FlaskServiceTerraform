FROM ubuntu:18.04

## Install python and flask
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
    && pip3 install flask \
    && pip3 install flask-api

## Create app directory
RUN mkdir -p var/www/flask
ADD hello.py /var/www/flask/hello.py
WORKDIR /var/www/flask 

## Run the service
EXPOSE 8000
CMD ["python3", "./hello.py"]
