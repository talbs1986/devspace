echo "cleaning self signed ssl keys..."
rm -f ${WS_PATH}/docker/syslog/localhost.*

echo "creating self signed ssl keys..."
openssl req -nodes -newkey rsa:2048 -keyout "${WS_PATH}/docker/syslog/localhost.key" -out "${WS_PATH}/docker/syslog/localhost.csr" -subj "/C=IL/ST=Tel Aviv/L=Tel Aviv/O=PerimeterX/OU=Integration Tests/CN=localhost"
sudo openssl x509 -req -days 365 -in "${WS_PATH}/docker/syslog/localhost.csr" -signkey "${WS_PATH}/docker/syslog/localhost.key" -out "${WS_PATH}/docker/syslog/localhost.crt"

echo "-> COPY CRT FOR CONFIG"
cat ${WS_PATH}/docker/syslog/localhost.crt

echo "starting syslog"
docker run -d -it --name syslog --rm -p 514:514/udp -p 601:601 -p 6514:6514 -v "${WS_PATH}/docker/syslog/localhost.crt:/etc/syslog-ng/localhost.crt" -v "${WS_PATH}/docker/syslog/localhost.key:/etc/syslog-ng/localhost.key" -v "${WS_PATH}/docker/syslog/syslog.conf:/etc/syslog-ng/syslog-ng.conf" balabit/syslog-ng:latest -edv
