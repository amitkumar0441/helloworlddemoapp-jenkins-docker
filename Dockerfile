FROM python:3.8-alpine

# Install system dependencies
RUN apk add --no-cache gcc musl-dev libffi-dev

# Create application directory
WORKDIR /app

# Copy dependency list and install
COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . /app


# Default command
CMD ["python3", "app.py"]

