FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"
RUN apt update -y
RUN apt install -y python3 python3-pip python3-dev build-essential python3-venv
ADD . /flask_app
WORKDIR /flask_app
# Tạo môi trường ảo
RUN python3 -m venv venv 
# Kích hoạt môi trường ảo và cài đặt gói
RUN ./venv/bin/pip install --upgrade pip
RUN ./venv/bin/pip install -r requirements.txt

ENTRYPOINT [".venv/bin/python"]
CMD ["flask_docker.py"]

