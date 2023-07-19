FROM opensearchproject/opensearch:2.8.0

COPY ./AIOps-OpniPreProcessor/build/distributions/opnipreprocessing.zip /usr/share/opensearch/
RUN bin/opensearch-plugin install --batch file:///usr/share/opensearch/opnipreprocessing.zip

