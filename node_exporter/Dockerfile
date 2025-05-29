# Dockerfile
FROM ubuntu:22.04

# Evitar interacción
ENV DEBIAN_FRONTEND=noninteractive

# Instala dependencias necesarias
RUN apt-get update && \
    apt-get install -y wget curl tar && \
    useradd -rs /bin/false nodeusr

# Descarga Node Exporter
RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.8.1/node_exporter-1.8.1.linux-amd64.tar.gz && \
    tar -xzf node_exporter-1.8.1.linux-amd64.tar.gz && \
    mv node_exporter-1.8.1.linux-amd64/node_exporter /usr/local/bin/ && \
    rm -rf node_exporter*

# Expone el puerto estándar
EXPOSE 9100

# Ejecuta node_exporter
USER nodeusr
ENTRYPOINT ["/usr/local/bin/node_exporter"]
