ARG FROM_BASE=base_container:20180210
FROM $FROM_BASE

# version of this docker image
ARG CONTAINER_VERSION=1.0.0 
LABEL version=$CONTAINER_VERSION  

# Add configuration and customizations
COPY build /tmp/

# build content
RUN set -o verbose \
    chmod u+rwx /tmp/container/build.sh \
    && /tmp/container/build.sh 'Perl 5-24-3'
RUN rm -rf /tmp/*
