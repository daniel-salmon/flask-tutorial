# flask-tutorial
A run-through of the Flask Tutorial

# Table of Contents

- [About](#about)
- [Usage](#usage)
  - [Initalize the Database](#init-db)
- [Build](#build)
- [Test](#test)

## About <a name="about"></a>

This implements the [Flask
tutorial](https://flask.palletsprojects.com/en/1.1.x/tutorial/).

## Usage <a name="usage"></a>

Note that all steps necessary to run the app are documented in the
`Dockerfile`.

That said first, you'll need to set two environment variables:

```
$ export FLASK_APP=flaskr
$ export FLASK_ENV=development
```

Then run the app with 

```
$ flask run
```

### Initialize the Database <a name="init-db"></a>

If this is the first time you run the app, you'll need to initialized the
database by creating a database in the `instance/` folder (not committed),
which can be done by executing

```
$ flask init-db
```

## Build <a name="build"></a>

First you'll need to build the Python wheel distribution file:

```sh
$ python setup.py bdist_wheel
```

Running that command should create a distribution file under a folder called
`dist/`. An example wheel file might look like
`dist/flaskr-1.0.0-py3-none-any.whl`.

Next we build the Docker image that will run the app. The `Dockerfile` will
build a base image using `python:3.6-alpine`. During the build, the wheel file
will get copied into the image. A typical image build can be executed with

```sh
$ docker build -t flaskr .
``` 

That will generate a Docker image named `flaskr` (with the default tag of
`latest`) using the `Dockerfile` in the top level directory.

Running a container with that image can be done with

```sh
$ docker run --name flaskr -p 5000:5000 flaskr
```

## Test <a name="test"></a>

The application can be tested by executing

```sh
$ pytest
```

`setup.cfg` provides configuration for running the tests.
