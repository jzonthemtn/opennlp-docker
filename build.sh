#!/bin/bash

. opennlp.properties

echo "Building image for OpenNLP ${OPENNLP_VERSION}..."

docker build --build-arg OPENNLP_VERSION=${OPENNLP_VERSION} -t upslopenlp/opennlp:${OPENNLP_VERSION} -t upslopenlp/opennlp:latest .
