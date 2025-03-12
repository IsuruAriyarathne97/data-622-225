# Use NVIDIA's official CUDA image with Python
FROM pytorch/pytorch:2.5.1-cuda12.4-cudnn9-runtime
SHELL ["/bin/bash", "-c"]

# Install Docker client and curl (Efficient Layering)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        docker.io && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Create a virtual environment for Python dependencies
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Copy the requirements.txt into the container
COPY requirements.txt ./requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set the PYTHONPATH to include the /app directory
ENV PYTHONPATH="$PYTHONPATH:/app"

# Create a non-root user for running the application
RUN useradd -m appuser
USER appuser

# Default command to run the application
CMD ["python", "main.py"]
