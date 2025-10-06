FROM neo4j:2025-enterprise AS data-loader

RUN mkdir -p /var/lib/neo4j/import/dump_source
COPY neo4j.dump /var/lib/neo4j/import/dump_source/neo4j.dump
USER neo4j
ENV DUMP_SOURCE_DIR=/var/lib/neo4j/import/dump_source


RUN \
    chmod 600 /var/lib/neo4j/conf/neo4j.conf && \
    \
    neo4j-admin database load neo4j --from-path=${DUMP_SOURCE_DIR} --overwrite-destination=true


FROM neo4j:2025-enterprise
COPY --from=data-loader /var/lib/neo4j/data /var/lib/neo4j/data

EXPOSE 7474 7687