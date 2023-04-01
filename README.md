# BP

Testing environment for bachelor thesis.

## Run enviroment

The test environment is divided into two parts, one in the **opentelemetry-demo** folder and the other in the **otel-collector**. In each section there is an **.env** file that contains the port and IP address configuration.

Then you can go to the folders and run the command:

```sh
docker compose up
```

### Pages

#### Opentelemetry-demo part

Webstore: http://localhost:8080/

Load Generator UI: http://localhost:8080/loadgen/ or http://localhost:8089/

#### Otel-collector part

Jaeger UI: http://localhost:16686

Grafana: http://localhost:3000




### Notes

1. If you are using a firewall you will need to open ports. At least it will be ports 4317 and 4318 and ports for sending Syslog and docker events.
2. To use the Fluent-Bit docker log collection, edit the address in **docker-compose.yml** in the **opentelemetry-demo** folder.
3. If you change ports of monitoring systems it will broke theirs datasources. Contact me stepan.bakaj@gmail.com.


## Experiments

They are in the **experiments** folder and you can run the first experiment as a shell script and the third and fourth using Python 3.

## Capture packets

Script **captureData.sh** which we use in chapter 3.2 for packet counting when sending telemetry data. In the script, modify the address where the Loadgen microservice runs to simulate users.
