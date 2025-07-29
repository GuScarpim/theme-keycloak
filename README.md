# Tema Overscore para Keycloak

Este é um tema personalizado para Keycloak com design moderno e responsivo, seguindo a identidade visual da Overscore.

## 📋 Funcionalidades

- ✅ Login responsivo
- ✅ Tela de registro
- ✅ Redefinição de senha
- ✅ Atualização de senha
- ✅ Autenticação OTP
- ✅ Configuração TOTP
- ✅ Telas de erro e informação
- ✅ Suporte a múltiplos idiomas
- ✅ Design adaptável para mobile e desktop
- ✅ Modo escuro automático

## 🚀 Como Executar Localmente

### Pré-requisitos

- Java 11 ou superior
- Maven 3.6+
- Docker (opcional, para testar com Keycloak)

### Opção 1: Executar com Keycloak Standalone

1. **Baixe o Keycloak:**
   ```bash
   # Baixe a versão mais recente do Keycloak
   wget https://github.com/keycloak/keycloak/releases/download/26.2.4/keycloak-26.2.4.tar.gz
   tar -xzf keycloak-26.2.4.tar.gz
   cd keycloak-26.2.4
   ```

2. **Copie o tema para o Keycloak:**
   ```bash
   # Copie a pasta do tema para o diretório themes
   cp -r themes/overscore themes/
   ```

3. **Inicie o Keycloak:**
   ```bash
   # Inicie o servidor
   ./bin/kc.sh start-dev
   ```

4. **Acesse o Keycloak:**
   - URL: http://localhost:8080
   - Usuário admin: admin
   - Senha: admin

### Opção 2: Executar com Docker

1. **Crie um Dockerfile para o tema:**
   ```dockerfile
   FROM quay.io/keycloak/keycloak:26.2.4
   
   # Copie o tema personalizado
   COPY themes/overscore /opt/keycloak/themes/overscore
   
   # Exponha a porta
   EXPOSE 8080
   
   # Comando padrão
   CMD ["start-dev"]
   ```

2. **Construa e execute:**
   ```bash
   docker build -t keycloak-overscore .
   docker run -p 8080:8080 keycloak-overscore
   ```

### Opção 3: Usar Docker Compose

1. **Crie um docker-compose.yml:**
   ```yaml
   version: '3.8'
   services:
     keycloak:
       image: quay.io/keycloak/keycloak:26.2.4
       ports:
         - "8080:8080"
       environment:
         KEYCLOAK_ADMIN: admin
         KEYCLOAK_ADMIN_PASSWORD: admin
       volumes:
         - ./themes/overscore:/opt/keycloak/themes/overscore
       command: start-dev
   ```

2. **Execute:**
   ```bash
   docker-compose up
   ```

## 🔧 Configuração do Tema

### 1. Configurar o Realm

1. Acesse o console de administração do Keycloak
2. Vá para **Realm Settings** > **Themes**
3. Selecione **overscore** como tema de login
4. Clique em **Save**

### 2. Configurar Internacionalização

1. Vá para **Realm Settings** > **Localization**
2. Marque **Internationalization enabled**
3. Selecione os idiomas desejados (en, pt-BR, es)
4. Salve as configurações

### 3. Configurar Redefinição de Senha

1. Vá para **Realm Settings** > **Authentication**
2. Configure o fluxo de redefinição de senha
3. Ative a opção **Reset Password Allowed**

## 🧪 Como Testar

### Testes Básicos

1. **Teste de Login:**
   - Acesse: http://localhost:8080/realms/master/account
   - Verifique se o tema está aplicado

2. **Teste de Responsividade:**
   - Abra as ferramentas de desenvolvedor do navegador
   - Teste diferentes tamanhos de tela (mobile, tablet, desktop)

3. **Teste de Idiomas:**
   - Verifique se o seletor de idioma funciona
   - Teste a troca entre português, inglês e espanhol

### Testes Avançados

1. **Teste de Registro:**
   - Configure um realm de teste
   - Ative o registro de usuários
   - Teste o fluxo completo de registro

2. **Teste de Redefinição de Senha:**
   - Configure o email (SMTP)
   - Teste o fluxo de redefinição

3. **Teste de TOTP:**
   - Configure autenticação de dois fatores
   - Teste a configuração do TOTP

## 📱 Responsividade

O tema é totalmente responsivo e funciona em:

- **Desktop:** 1200px+
- **Tablet:** 768px - 1199px
- **Mobile:** 320px - 767px
- **Mobile pequeno:** < 320px

### Breakpoints

- `@media (max-width: 768px)`: Layout em coluna
- `@media (max-width: 480px)`: Otimizações para mobile
- `@media (max-width: 320px)`: Telas muito pequenas

## 🎨 Personalização

### Cores

As cores principais do tema são:
- **Primária:** #0e4b4e (verde escuro)
- **Secundária:** #0a3a3d (verde mais escuro)
- **Texto:** #666 (cinza)
- **Fundo:** #f5f5f5 (cinza claro)

### Modo Escuro

O tema suporta modo escuro automático baseado nas preferências do sistema:
- `@media (prefers-color-scheme: dark)`

## 🔄 Atualização no Keycloak Docker

### Método 1: Volume Bind

```bash
docker run -p 8080:8080 \
  -v $(pwd)/themes/overscore:/opt/keycloak/themes/overscore \
  quay.io/keycloak/keycloak:26.2.4 start-dev
```

### Método 2: Docker Compose

```yaml
version: '3.8'
services:
  keycloak:
    image: quay.io/keycloak/keycloak:26.2.4
    ports:
      - "8080:8080"
    environment:
      KEYCLOAK_ADMIN: admin
      KEYCLOAK_ADMIN_PASSWORD: admin
    volumes:
      - ./themes/overscore:/opt/keycloak/themes/overscore
    command: start-dev
```

### Método 3: Copiar para Container Existente

```bash
# Se você já tem um container rodando
docker cp themes/overscore container_name:/opt/keycloak/themes/

# Reinicie o container
docker restart container_name
```

## 🐛 Solução de Problemas

### Tema não aparece

1. Verifique se o tema foi copiado corretamente:
   ```bash
   ls -la /opt/keycloak/themes/overscore/
   ```

2. Verifique as permissões:
   ```bash
   chmod -R 755 themes/overscore/
   ```

3. Reinicie o Keycloak após copiar o tema

### Problemas de CSS

1. Limpe o cache do navegador
2. Verifique se o arquivo CSS está sendo carregado
3. Verifique a console do navegador para erros

### Problemas de Responsividade

1. Verifique se o viewport está configurado
2. Teste em diferentes dispositivos
3. Use as ferramentas de desenvolvedor do navegador

## 📁 Estrutura do Projeto

```
themes/overscore/
├── login/
│   ├── login.ftl              # Tela principal de login
│   ├── register.ftl           # Tela de registro
│   ├── login-reset-password.ftl  # Redefinição de senha
│   ├── login-update-password.ftl # Atualização de senha
│   ├── login-otp.ftl         # Autenticação OTP
│   ├── login-config-totp.ftl # Configuração TOTP
│   ├── error.ftl             # Tela de erro
│   ├── info.ftl              # Tela de informação
│   ├── template.ftl          # Template base
│   ├── theme.properties      # Configurações do tema
│   ├── messages/             # Arquivos de internacionalização
│   └── resources/
│       ├── css/
│       │   └── styles.css    # Estilos CSS
│       ├── js/
│       │   └── language-selector.js
│       └── img/
│           ├── overscore_logo.svg
│           └── overlabs_logo.png
```

## 🤝 Contribuição

Para contribuir com o projeto:

1. Faça um fork do repositório
2. Crie uma branch para sua feature
3. Faça as alterações
4. Teste localmente
5. Envie um pull request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 📞 Suporte

Para suporte ou dúvidas:
- Abra uma issue no GitHub
- Entre em contato com a equipe Overscore 