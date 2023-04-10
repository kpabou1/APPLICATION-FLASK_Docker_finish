# Use the official Python image as the parent image
FROM python:3.9.7-slim-bullseye

# Set the working directory in the container
WORKDIR /dataFlask
ENV FLASK_APP=main.py
ENV FLASK_RUN_HOST=0.0.0.0
# Copy the requirements file into the container
COPY requirements.txt requirements.txt
# Install the requirements

RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update && \
    apt-get install -y libsqlite3-dev

RUN pip install --upgrade pip && pip install -r requirements.txt && pip install uvicorn && pip install flask_sqlalchemy
RUN pip install flask-migrate



# Copy the application code into the container
COPY . .

# Expose the port that the application will run on
EXPOSE 5000

# Start the application
CMD [ "flask", "run" ]
