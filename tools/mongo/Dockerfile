FROM mongo:4.4

VOLUME /data
EXPOSE 27017 27018 27019

COPY startCluster.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startCluster.sh

ENTRYPOINT ["startCluster.sh"]
