FROM ubuntu:22.04

# Evita preguntas durante instalaciones
ENV DEBIAN_FRONTEND=noninteractive

# Instala Ansible, curl, unzip y dependencias necesarias
RUN apt-get update && \
    apt-get install -y ansible curl unzip && \
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cd rclone-*-linux-amd64 && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    cd .. && \
    rm -rf rclone-*-linux-amd64 rclone-current-linux-amd64.zip

# Define el directorio de trabajo
WORKDIR /etc/ansible

# Copia archivos del directorio ansible al contenedor
COPY ./ansible /etc/ansible

# Mantiene el contenedor activo
CMD ["tail", "-f", "/dev/null"]
