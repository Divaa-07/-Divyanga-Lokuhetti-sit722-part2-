# Dockerfile for book_catalog microservice

# Use the official Python 3.11 image with Alpine Linux (a lightweight distribution)
FROM python:3.11-alpine


# Set the working directory inside the container to /app
WORKDIR /app

# Copy the requirements.txt file from the book_catalog directory on the host to the /app directory in the container
COPY book_catalog/requirements.txt .

# Install the required Python packages inside the container without caching files to save space
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the files from the book_catalog directory on the host to the /app directory in the container
COPY book_catalog/ .


# Set the default command to run when the container starts
# This starts the Uvicorn server, runs the "main:app" FastAPI app, 
# and binds it to 0.0.0.0 (making it accessible from any network interface) on port 8000
CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000" ]





