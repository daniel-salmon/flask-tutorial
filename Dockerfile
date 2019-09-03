# Define Python version
ARG PYTHON_VERSION=3.6

FROM python:${PYTHON_VERSION}

WORKDIR /home/flaskr

# Create Python virtual environment
RUN python -m venv venv

RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install uwsgi

# Copy callable wsgi file and uwsgi configurations
COPY wsgi.py uwsgi.ini ./ 

# Copy the flaskr wheel file into the container
COPY dist/flaskr-1.0.0-py3-none-any.whl flaskr-1.0.0-py3-none-any.whl

# Install the flaskr application
RUN venv/bin/pip install flaskr-1.0.0-py3-none-any.whl

# Set flask environment variables
ENV FLASK_APP=flaskr
ENV FLASK_ENV=production

# Initialize the SQLite database file
RUN venv/bin/flask init-db

EXPOSE 5000

CMD ["venv/bin/uwsgi", "--ini", "uwsgi.ini"]
