FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:latest

# Set environment variables
ENV PASSWORD 'rstudio'
ENV PATH ${PATH}:/opt/software/bin

# Set working directory
WORKDIR /home/rstudio

# Switch to root user
USER root

# Install necessary packages
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y sudo git ffmpeg nodejs npm wget mc imagemagick && \
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && \
    source ~/.bashrc && \
    nvm install 23.5.0 && \
    npm i -g pm2

# Expose the necessary ports (for RStudio Server, for example)
EXPOSE 8787

# Set the entrypoint or CMD as needed
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize", "false"]
