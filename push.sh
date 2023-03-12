#!/bin/bash

VERSION=${1:-"2.1.1"}

docker push upslopenlp/opennlp:$VERSION
docker push upslopenlp/opennlp:latest
