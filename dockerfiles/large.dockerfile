# Use a base Python image
FROM python:latest 

# Install the required packages
RUN update-ca-certificates && pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt --no-cache-dir

# Set the working directory in the container
WORKDIR /app

# Copy all the directory into the container (except of the .dockerignor files)
COPY . .

# Expose the port on which the Flask app will run
EXPOSE 5000

ENV ROOM_FILES_PATH "rooms/"
ENV USERS_PATH "users.csv"
ENV FLASK_ENV development


# Run the Flask app
CMD ["python", "./chatApp.py"]