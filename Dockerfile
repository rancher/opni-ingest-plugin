FROM opensearchproject/opensearch:2.4.0

COPY ./Logging-OpniJsonDetector/build/distributions/opnijsondetector.zip /usr/share/opensearch/
RUN bin/opensearch-plugin install --batch file:///usr/share/opensearch/opnijsondetector.zip

COPY ./AIOps-OpniPreProcessor/build/distributions/opnipreprocessing.zip /usr/share/opensearch/
RUN bin/opensearch-plugin install --batch file:///usr/share/opensearch/opnipreprocessing.zip

