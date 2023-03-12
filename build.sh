#!/bin/bash

VERSION=${1:-"2.1.1"}

docker build --build-arg OPENNLP_VERSION=$VERSION -t upslopenlp/opennlp:$VERSION -t upslopenlp/opennlp:latest .
