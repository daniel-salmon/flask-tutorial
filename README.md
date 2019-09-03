# flask-tutorial
A run-through of the [Flask
tutorial](https://flask.palletsprojects.com/en/1.1.x/tutorial/) +
[Nginx](https://www.nginx.com)

# Table of Contents

- [About](#about)
- [Usage](#usage)
  - [With Docker](#docker)
  - [Bare Metal](#bare-metal)
- [Build the Wheel](#build)
- [Test](#test)

## About <a name="about"></a>

This implements the [Flask
tutorial](https://flask.palletsprojects.com/en/1.1.x/tutorial/), but places the
app behind an Nginx web server. See my related repository at
[`daniel-salmon/flask-docker-nginx`](https://github.com/daniel-salmon/flask-docker-nginx)
for a "Hello, World!" example that goes through specifics of the configuration.

## Usage <a name="usage"></a>

### With Docker <a name="docker"></a>

This way is better if you plan to be deploying this in the wild, but it
requires Docker and Docker Compose.

For a first run:

```
$ docker-compose up --build
```

On subsequent runs, the `--build` flag can be omitted; providing it builds the
image dictated by `Dockerfile`.

To bring the project down:

```
$ docker-compose down
```

### Bare Metal <a name="bare-metal"></a>

You can also run the app "bare metal". Note that all steps necessary to run the
app are documented in the `Dockerfile`, with the caveat that the Dockerfile
ultimately runs the app using uWSGI so that it can coordinate with Nginx.

You'll need to set two environment variables:

```
$ export FLASK_APP=flaskr
$ export FLASK_ENV=development
```

If this is the first time you run the app, you'll need to initialize the
database by creating a database in the `instance/` folder (not committed),
which can be done by executing

```
$ flask init-db
```

Then run the app with 

```
$ flask run
```

## Build the Wheel <a name="build"></a>

First you'll need to build the Python wheel distribution file:

```sh
$ python setup.py bdist_wheel
```

Running that command should create a distribution file under a folder called
`dist/`. An example wheel file might look like
`dist/flaskr-1.0.0-py3-none-any.whl`.

Docker will copy the wheel file into the image at build time.

## Test <a name="test"></a>

The application can be tested by executing

```sh
$ pytest
```

`setup.cfg` provides configuration for running the tests.
