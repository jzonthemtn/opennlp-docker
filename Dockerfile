FROM openjdk:11.0.16
MAINTAINER UpslopeNLP (hey@upslopenlp.com)
ARG OPENNLP_VERSION
RUN apt-get update && apt-get -y dist-upgrade
ADD https://dlcdn.apache.org/opennlp/opennlp-$OPENNLP_VERSION/apache-opennlp-$OPENNLP_VERSION-bin.tar.gz /opt
RUN tar -xf /opt/apache-opennlp-$OPENNLP_VERSION-bin.tar.gz -C /opt/
RUN rm /opt/apache-opennlp-$OPENNLP_VERSION-bin.tar.gz
RUN ln -s /opt/apache-opennlp-$OPENNLP_VERSION/ /opt/apache-opennlp
CMD ["sh"]
