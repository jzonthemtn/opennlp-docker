#!/bin/bash

VERSION=${1:-"2.0.0"}

docker build --build-arg OPENNLP_VERSION=$VERSION -t upslopenlp/opennlp:$VERSION .
