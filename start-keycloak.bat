@echo off
echo ========================================
echo   Iniciando Keycloak com Tema Overscore
echo ========================================
echo.

echo Verificando se o Docker está instalado...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Docker não está instalado ou não está no PATH
    echo Por favor, instale o Docker Desktop e tente novamente
    pause
    exit /b 1
)

echo Docker encontrado!
echo.

echo Parando containers existentes...
docker-compose down

echo.
echo Iniciando Keycloak...
docker-compose up -d

echo.
echo Aguardando Keycloak inicializar...
timeout /t 10 /nobreak >nul

echo.
echo ========================================
echo   Keycloak está rodando!
echo ========================================
echo.
echo URL: http://localhost:8081
echo Usuario: admin
echo Senha: admin
echo.
echo Para parar o Keycloak, execute: docker-compose down
echo.
pause 