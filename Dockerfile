# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# RUN pip install flask
RUN apk add sudo
RUN adduser -D $USER docker
RUN sudo -i
RUN apk update
RUN apk add postgresql postgresql-client go
RUN export PATH=$PATH:/usr/local/go/bin
RUN go version
RUN go mod init httpserver/main.go
RUN mkdir go_files
COPY httpserver/edit.html go_files/
COPY httpserver/view.html go_files/
COPY httpserver/main.go go_files/
COPY cmd.sh cmd.sh
RUN chmod +x go_files/main.go
CMD ["/bin/sh", "serv.sh"]