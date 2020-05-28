# This Dockerfile builds a Docker image called `tele-buildbox`.  The
# resulting container image will contain `tele` tool and can be used
# to create Cluster images from within a container.

FROM quay.io/gravitational/debian-grande:buster

ARG TELE_VERSION
RUN apt-get update
RUN apt-get -y install curl make git
RUN curl https://get.gravitational.io/telekube/bin/${TELE_VERSION}/linux/x86_64/tele -o /usr/bin/tele && chmod 755 /usr/bin/tele
