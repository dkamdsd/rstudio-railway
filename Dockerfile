FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:latest

# Set environment variables
ENV PASSWORD 'rstudio'
ENV PATH ${PATH}:/opt/software/bin

# Set working directory
WORKDIR /home/rstudio

# Switch to root user
USER root

# Install necessary packages and the latest version of Node.js
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y sudo git ffmpeg wget mc imagemagick curl && \
    curl -sL https://deb.nodesource.com/setup_current.x | bash - && \
    apt install -y nodejs && \
    npm i -g pm2

# Ensure terminal defaults to root
RUN echo "auth-root-enabled=1" >> /etc/rstudio/rserver.conf && \
    echo "sudo su -" > /home/rstudio/.Rprofile && \
    chown rstudio:rstudio /home/rstudio/.Rprofile

# Expose the necessary ports (for RStudio Server, for example)
EXPOSE 8787

# Set the entrypoint or CMD as needed
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize", "false"]
