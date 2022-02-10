# Jupyter Lab Docker container image

Simple single-user container image for:
- Jupyter Lab (including JupyterLab Git UI)
- Minconda Python distribution (including Conda)
- R and IRkernel

## Quickstart usage:

```
docker run --rm --user root -v $(pwd):/opt/notebooks -p 8888:8888 ubcdsci/jupyterlab
```

## Documentation

This image is built off of the [continuumio/miniconda3](https://hub.docker.com/r/continuumio/miniconda3) image ([Dockerfile](https://github.com/ContinuumIO/docker-images/blob/master/miniconda3/debian/Dockerfile)).

The Jupyter Lab working directory is set to `/opt/notebooks`, 
so volumes should be mounted there to be accessible via the container's Jupyter Lab.

The port exposed is `8888`. When the container is run, users need to copy the URL that looks like `http://127.0.0.1:8888/lab?token=d9704724bf0267d3d9262698ffbb88123633f8c8f4b1a305` into their web browser to access Jupyter Lab.

`--user root` is currently needed when running the container for mounting volumes. This may be removed in future versions.
