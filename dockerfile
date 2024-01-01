# Use the debian:stable-20231030-slim base image
FROM debian:stable-20231030-slim

# Install Git to capture commit information
RUN apt-get update && apt-get install -y git

# Capture the current Git commit information
RUN git init && \
    git remote add origin https://github.com/strCheese/ai-med-project.git && \
    git pull origin main

# Clean up the package cache to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
