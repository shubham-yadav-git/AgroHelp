# Use an official Python runtime as the base image
FROM python:3.9-buster

# Install Git
RUN apt-get update && apt-get install -y git

# Set the working directory in the container
WORKDIR /app

# Clone the Flask app from Git repository
RUN git clone https://github.com/shubham-yadav-git/AgroHelp

WORKDIR /app/AgroHelp

# Install the required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Expose port 5000 for Flask to listen on
EXPOSE 5000

# Start the Flask server
CMD ["flask", "run", "--host=0.0.0.0"]