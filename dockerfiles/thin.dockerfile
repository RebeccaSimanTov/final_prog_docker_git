# ---------------------   Stage 1: Build Dependencies -----------------------------

FROM python:3.9-slim AS builder

# Set the working directory in the builder stage
WORKDIR /build

# Copy only the requirements file initially (for caching)
COPY requirements.txt .

# Install Python packages into a virtual environment
RUN update-ca-certificates  
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt --no-cache-dir


#------------------------  Stage 2: Production Image  -------------------------------
FROM python:3.9-slim


# Copy your application code
COPY . .

# Set the working directory in the production stage
WORKDIR /app


# Expose the port on which the Flask app will run
EXPOSE 5000

# Set environment variables (if any)
ENV ROOM_FILES_PATH "rooms/"
ENV USERS_PATH "users.csv"
ENV FLASK_ENV production

# Run the Flask app
CMD ["python", "./chatApp.py"]
