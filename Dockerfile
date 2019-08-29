# Define Python version
ARG PYTHON_VERSION=3.6

FROM python:${PYTHON_VERSION}-alpine

WORKDIR /home/flask-tutorial

RUN python -m venv venv

COPY dist/flaskr-1.0.0-py3-none-any.whl flaskr-1.0.0-py3-none-any.whl
RUN venv/bin/pip install flaskr-1.0.0-py3-none-any.whl

ENV FLASK_APP=flaskr
RUN venv/bin/flask init-db

CMD ["venv/bin/flask", "run", "--host", "0.0.0.0"]
