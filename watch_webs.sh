#!/bin/bash

# Variables de estado anteriores
was_web1_up=false
was_web2_up=false

while true; do
  # Estado actual de web1
  if docker ps --format '{{.Names}}' | grep -q '^web1$'; then
    if ! $was_web1_up; then
      echo "[INFO] web1 está activo, iniciando nginx_exporter_web1..."
      docker start nginx_exporter_web1 >/dev/null 2>&1
      was_web1_up=true
    fi
  else
    if $was_web1_up; then
      echo "[INFO] web1 está apagado, deteniendo nginx_exporter_web1..."
      docker stop nginx_exporter_web1 >/dev/null 2>&1
      was_web1_up=false
    fi
  fi

  # Estado actual de web2
  if docker ps --format '{{.Names}}' | grep -q '^web2$'; then
    if ! $was_web2_up; then
      echo "[INFO] web2 está activo, iniciando nginx_exporter_web2..."
      docker start nginx_exporter_web2 >/dev/null 2>&1
      was_web2_up=true
    fi
  else
    if $was_web2_up; then
      echo "[INFO] web2 está apagado, deteniendo nginx_exporter_web2..."
      docker stop nginx_exporter_web2 >/dev/null 2>&1
      was_web2_up=false
    fi
  fi

  sleep 5
done
