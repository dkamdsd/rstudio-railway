FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:latest

ENV PASSWORD 'rstudio'
ENV PATH ${PATH}:/opt/software/bin

WORKDIR /home/rstudio