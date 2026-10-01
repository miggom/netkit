# What is this 

This is a normal container based on ubuntu that gathers a set of networking tools 
There is no need to install all the networking tools in the host. It is as easy as download this image, run the tool, and remove the container

# How to build to include new tools

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



