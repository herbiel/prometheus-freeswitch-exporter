# syntax=docker/dockerfile:1

FROM python:3.7-slim-buster

WORKDIR /app

COPY ./prometheus-freeswitch-exporter . 
COPY prometheus-freeswitch-exporter/esl.yml /app/esl.yml  
RUN python setup.py install

EXPOSE 9724
CMD [ "freeswitch_exporter", "esl.yml"]
