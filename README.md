# What is this 

This is a normal container based on ubuntu that gathers a set of networking tools 

There is no need to install all the networking tools in the host anymore. It is as easy as download this image, run the tool, and remove the container



# Build your own container with new tools

## usage 


`./build_netkit_version.sh --no-cache v1`

* Build script: this script runs the docker command to create an image based on a dockerfile with a set of tools
* --no-cache flag: The script accepts to bypass the cache images or to reuse the already built image layers
* v1: This argument allows you to tag the images and to have different versions 

## output

* docker image called miggom/netkit:version
* sbom.txt with packets in the docker host

# Dockerhub

miggom/netkit:latest

# Dockerhub link

[miggom/netkit:latest](https://hub.docker.com/r/miggom/netkit)


![License](https://img.shields.io/github/license/miggom/netkit)
![Docker](https://img.shields.io/badge/docker-ready-blue?logo=docker)
![Last commit](https://img.shields.io/github/last-commit/miggom/netkit)