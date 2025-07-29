# Como Atualizar o Tema Overscore no Keycloak Docker

## 🚀 Métodos de Atualização

### Método 1: Usando Docker Compose (Recomendado)

1. **Pare o container atual:**
   ```bash
   docker-compose down
   ```

2. **Inicie novamente:**
   ```bash
   docker-compose up -d
   ```

3. **Verifique se está funcionando:**
   ```bash
   docker-compose logs -f keycloak
   ```

### Método 2: Copiar para Container Existente

1. **Identifique o container:**
   ```bash
   docker ps
   ```

2. **Copie o tema para o container:**
   ```bash
   docker cp themes/overscore container_name:/opt/keycloak/themes/
   ```

3. **Reinicie o container:**
   ```bash
   docker restart container_name
   ```

### Método 3: Usando Volume Bind

1. **Pare o container atual**
2. **Execute com volume bind:**
   ```bash
   docker run -p 8080:8080 \
     -v $(pwd)/themes/overscore:/opt/keycloak/themes/overscore \
     quay.io/keycloak/keycloak:26.2.4 start-dev
   ```

## 🔧 Configuração no Keycloak

### 1. Acesse o Console de Administração

- URL: http://localhost:8080
- Usuário: admin
- Senha: admin

### 2. Configure o Tema

1. **Vá para Realm Settings:**
   - Clique no nome do realm (ex: master)
   - Clique em "Realm Settings"

2. **Configure o Tema:**
   - Vá para a aba "Themes"
   - Em "Login Theme", selecione "overscore"
   - Clique em "Save"

### 3. Configure Internacionalização (Opcional)

1. **Vá para Realm Settings > Localization:**
   - Marque "Internationalization enabled"
   - Em "Supported locales", adicione: en, pt-BR, es
   - Em "Default locale", selecione: pt-BR
   - Clique em "Save"

### 4. Configure Redefinição de Senha

1. **Vá para Realm Settings > Authentication:**
   - Clique na aba "Flows"
   - Copie o fluxo "Reset credentials"
   - Configure o fluxo copiado
   - Ative o fluxo

2. **Vá para Realm Settings > Login:**
   - Marque "Reset password allowed"
   - Clique em "Save"

## 🧪 Testando as Atualizações

### 1. Teste de Login

1. **Acesse a página de login:**
   ```
   http://localhost:8080/realms/master/account
   ```

2. **Verifique se o tema está aplicado:**
   - Logo da Overscore
   - Cores corretas
   - Layout responsivo

### 2. Teste de Responsividade

1. **Abra as ferramentas de desenvolvedor (F12)**
2. **Teste diferentes tamanhos:**
   - Mobile: 375px
   - Tablet: 768px
   - Desktop: 1200px

### 3. Teste de Idiomas

1. **Verifique o seletor de idioma**
2. **Teste a troca entre idiomas**
3. **Verifique se as mensagens mudam**

## 🔄 Atualizações Automáticas

### Usando Watch Mode (Desenvolvimento)

Para desenvolvimento, você pode usar o modo watch:

```bash
# Pare o container
docker-compose down

# Inicie com volume bind para atualizações automáticas
docker run -p 8080:8080 \
  -v $(pwd)/themes/overscore:/opt/keycloak/themes/overscore \
  quay.io/keycloak/keycloak:26.2.4 start-dev
```

### Usando Docker Compose com Watch

Crie um `docker-compose.dev.yml`:

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
    restart: unless-stopped
```

Execute com:
```bash
docker-compose -f docker-compose.dev.yml up -d
```

## 🐛 Solução de Problemas

### Tema não aparece

1. **Verifique se o tema foi copiado:**
   ```bash
   docker exec -it container_name ls -la /opt/keycloak/themes/overscore/
   ```

2. **Verifique as permissões:**
   ```bash
   docker exec -it container_name chmod -R 755 /opt/keycloak/themes/overscore/
   ```

3. **Reinicie o Keycloak:**
   ```bash
   docker restart container_name
   ```

### Cache do Navegador

1. **Limpe o cache do navegador**
2. **Use Ctrl+F5 para forçar reload**
3. **Teste em modo incógnito**

### Logs do Keycloak

1. **Verifique os logs:**
   ```bash
   docker-compose logs -f keycloak
   ```

2. **Procure por erros relacionados ao tema**

### Verificar Configuração

1. **Acesse o console de administração**
2. **Vá para Realm Settings > Themes**
3. **Verifique se "overscore" está selecionado**

## 📝 Comandos Úteis

### Parar Keycloak
```bash
docker-compose down
```

### Ver logs
```bash
docker-compose logs -f keycloak
```

### Entrar no container
```bash
docker exec -it keycloak-overscore /bin/bash
```

### Verificar arquivos do tema
```bash
docker exec -it keycloak-overscore ls -la /opt/keycloak/themes/overscore/
```

### Reiniciar apenas o Keycloak
```bash
docker-compose restart keycloak
```

## 🎯 Checklist de Atualização

- [ ] Tema copiado para o container
- [ ] Container reiniciado
- [ ] Tema configurado no Keycloak
- [ ] Responsividade testada
- [ ] Idiomas testados
- [ ] Funcionalidades testadas
- [ ] Logs verificados
- [ ] Cache limpo 