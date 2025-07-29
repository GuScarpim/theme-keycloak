#!/bin/bash

echo "========================================"
echo "  Iniciando Keycloak com Tema Overscore"
echo "========================================"
echo

echo "Verificando se o Docker está instalado..."
if ! command -v docker &> /dev/null; then
    echo "ERRO: Docker não está instalado"
    echo "Por favor, instale o Docker e tente novamente"
    exit 1
fi

echo "Docker encontrado!"
echo

echo "Verificando se o Docker Compose está instalado..."
if ! command -v docker-compose &> /dev/null; then
    echo "ERRO: Docker Compose não está instalado"
    echo "Por favor, instale o Docker Compose e tente novamente"
    exit 1
fi

echo "Docker Compose encontrado!"
echo

echo "Parando containers existentes..."
docker-compose down

echo
echo "Iniciando Keycloak..."
docker-compose up -d

echo
echo "Aguardando Keycloak inicializar..."
sleep 10

echo
echo "========================================"
echo "  Keycloak está rodando!"
echo "========================================"
echo
echo "URL: http://localhost:8081"
echo "Usuario: admin"
echo "Senha: admin"
echo
echo "Para parar o Keycloak, execute: docker-compose down"
echo 