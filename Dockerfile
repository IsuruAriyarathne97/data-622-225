# Use NVIDIA's official CUDA image with Python
FROM pytorch/pytorch:2.5.1-cuda12.4-cudnn9-runtime
SHELL ["/bin/bash", "-c"]

# Install Docker client and curl
RUN apt-get update && apt-get install -y \
    curl \
    docker.io \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt to the Docker image
COPY requirements.txt ./requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONPATH="$PYTHONPATH:/app"
