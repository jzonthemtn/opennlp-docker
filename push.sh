#!/bin/bash

VERSION=${1:-"2.0.0"}

docker push upslopenlp/opennlp:$VERSION
docker push upslopenlp/opennlp:latest
