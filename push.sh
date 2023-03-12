#!/bin/bash

. opennlp.properties

docker push upslopenlp/opennlp:${OPENNLP_VERSION}
docker push upslopenlp/opennlp:latest
