FROM opensearchproject/opensearch:2.4.0

COPY ./build/distributions/opnipreprocessing.zip /usr/share/opensearch/
RUN bin/opensearch-plugin install --batch file:///usr/share/opensearch/opnipreprocessing.zip

