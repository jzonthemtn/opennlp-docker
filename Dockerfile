FROM openjdk:11.0.16
MAINTAINER UpslopeNLP (hey@upslopenlp.com)
ARG OPENNLP_VERSION
RUN apt-get update && apt-get -y dist-upgrade
ADD https://dlcdn.apache.org/opennlp/opennlp-2.0.0/apache-opennlp-$OPENNLP_VERSION-bin.tar.gz /opt
RUN tar -xf /opt/apache-opennlp-$OPENNLP_VERSION-bin.tar.gz -C /opt/
RUN rm /opt/apache-opennlp-$OPENNLP_VERSION-bin.tar.gz
RUN ln -s /opt/apache-opennlp-2.0.0/ /opt/apache-opennlp
CMD ["sh"]
