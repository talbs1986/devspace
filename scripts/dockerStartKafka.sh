#-v ${WS_PATH}/docker/zk/data:/opt/zookeeper-3.4.6/data 

docker run --name zk --restart=always -it -d -p 2181:2181 wurstmeister/zookeeper:3.4.6
sleep 3s
#-v ${WS_PATH}/docker/kafka:/kafka
docker run --name kafka --restart=always -it -d --link zk -v /var/run/docker.sock:/var/run/docker.sock -p 9092:9092 -e KAFKA_ZOOKEEPER_CONNECT=zk:2181 -e KAFKA_ADVERTISED_HOST_NAME=localhost wurstmeister/kafka:0.10.2.1
sleep 3s
docker run --name km --restart=always -it -d --link zk -p 9000:9000 -e ZK_HOSTS="zk:2181" -v ${WS_PATH}/docker/kafkamanager/config:/kafka-manager-1.2.7/conf -e APPLICATION_SECRET=notyourdefaultsecret sheepkiller/kafka-manager

# docker network connect local-dev-net zk
# docker network connect local-dev-net km
# docker network connect local-dev-net kafka