# Use the debian:stable-20231030-slim base image
FROM debian:stable-20231030-slim

# Install Python3, pip, venv, and Git
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv git

# Set the working directory
WORKDIR /home/putty-ssh/ai/med

# Copy the requirements.txt file into the container
COPY requirements.txt ./

# Create and activate the virtual environment, then install Python libraries
RUN python3 -m venv venv && \
    /bin/bash -c "source venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt"

# Clean up the package cache to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Automatically activate the virtual environment when starting bash
RUN echo "source /home/putty-ssh/ai/med/venv/bin/activate" >> ~/.bashrc
