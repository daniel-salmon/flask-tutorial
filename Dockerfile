# Define Python version
ARG PYTHON_VERSION=3.6

FROM python:${PYTHON_VERSION}-alpine

WORKDIR /home/flask-tutorial

# Create Python virtual environment
RUN python -m venv venv

# Copy the flaskr wheel file into the container
COPY dist/flaskr-1.0.0-py3-none-any.whl flaskr-1.0.0-py3-none-any.whl

# Install the flaskr application
RUN venv/bin/pip install flaskr-1.0.0-py3-none-any.whl

# Set flask environment variables
ENV FLASK_APP=flaskr
ENV FLASK_ENV=production

# Initialize the SQLite database file
RUN venv/bin/flask init-db

CMD ["venv/bin/flask", "run", "--host", "0.0.0.0"]
