# Unofficial Apache OpenNLP Docker Image

This repository is an unofficial Docker image for [Apache OpenNLP](https://opennlp.apache.org). Available tags can be viewed on [Docker Hub](https://hub.docker.com/r/upslopenlp/opennlp).

This image and repository are maintained by [UpslopeNLP](https://www.upslopenlp.com).

## Pulling and Running the Container

To pull and run a container:

```
docker pull upslopenlp/opennlp:2.0.0
docker run --rm -it upslopenlp/opennlp:2.0.0 /bin/bash
```

The Apache OpenNLP binaries will be available in the container under `/opt/apache-opennlp/bin`.

## Training and Evaluating a Model with a Container

You can train and evaluate a model using a container. First, get the some training data.

```
wget https://data.deepai.org/conll2003.zip
unzip conll2003.zip -d /tmp
```

Now run the container:

```
# Convert the training/test data to OpenNLP format.
docker run -v /tmp:/tmp --rm upslopenlp/opennlp:2.0.0 /opt/apache-opennlp/bin/opennlp TokenNameFinderConverter conll03 -lang eng -types per -data /tmp/train.txt > /tmp/corpus_train.txt
docker run -v /tmp:/tmp --rm upslopenlp/opennlp:2.0.0 /opt/apache-opennlp/bin/opennlp TokenNameFinderConverter conll03 -lang eng -types per -data /tmp/test.txt > /tmp/corpus_test.txt

# Train a person recognition model.
docker run -v /tmp:/tmp --rm upslopenlp/opennlp:2.0.0 /opt/apache-opennlp/bin/opennlp TokenNameFinderTrainer -model /tmp/en_ner_person.bin -lang eng -data /tmp/corpus_train.txt -nameTypes person

# Evaluate the model.
docker run -v /tmp:/tmp --rm upslopenlp/opennlp:2.0.0 /opt/apache-opennlp/bin/opennlp TokenNameFinderEvaluator -model /tmp/en_ner_person.bin -data /tmp/corpus_test.txt -nameTypes person
```

The above commands format the training/test data, train a person recognition model, and then evaluates the model. Expected output:

```
Loading Token Name Finder model ... done (0.119s)


Average: 3929.5 sent/s
Total: 3454 sent
Runtime: 0.879s

Evaluated 3453 samples with 1617 entities; found: 1472 entities; correct: 1370.
       TOTAL: precision:   93.07%;  recall:   84.72%; F1:   88.70%.
      person: precision:   93.07%;  recall:   84.72%; F1:   88.70%. [target: 1617; tp: 1370; fp: 102]
Execution time:
1.185 seconds
```
