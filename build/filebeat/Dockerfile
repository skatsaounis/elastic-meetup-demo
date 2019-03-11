# This Dockerfile was generated from templates/Dockerfile.j2
FROM centos:7

RUN yum update -y && yum install -y curl && yum clean all

COPY filebeat /usr/share/filebeat

ENV ELASTIC_CONTAINER true
ENV PATH=/usr/share/filebeat:$PATH

COPY config /usr/share/filebeat

# Add entrypoint wrapper script
ADD docker-entrypoint /usr/local/bin

# Provide a non-root user.
RUN groupadd --gid 1000 filebeat && \
    useradd -M --uid 1000 --gid 1000 --home /usr/share/filebeat filebeat

WORKDIR /usr/share/filebeat
RUN mkdir data logs && \
    chown -R root:filebeat . && \
    find /usr/share/filebeat -type d -exec chmod 0750 {} \; && \
    find /usr/share/filebeat -type f -exec chmod 0640 {} \; && \
    chmod 0750 /usr/share/filebeat/filebeat && \chmod 0770 modules.d && \
    chmod 0770 data logs
USER 1000


ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
CMD ["-e"]
