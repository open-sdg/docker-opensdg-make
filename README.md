# opensdg/make Docker image

Docker image for easier usage of make in open-sdg

## Install image

```bash
docker pull opensdg/make:0.3
```

## Create container from image

From `open-sdg` root:

```bash
docker run -it --rm \
-p 4000:4000 \
-v $PWD:/repo \
opensdg/make:0.3 \
bash
```

## Run `make` commands in container

### Serve site

```bash
serve
```

This command should be used instead of `make serve`.

## Other commands

* `make test.html`

* `make test.accessibility`

A problem with CucumberJS, doesn't make it possible for tests to run in a Docker container currently.
