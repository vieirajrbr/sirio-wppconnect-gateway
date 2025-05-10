# sirio-wppconnect-gateway

Este repositório contém apenas a infraestrutura Docker necessária para rodar o servidor WPPConnect como container isolado.

### Objetivo
Rodar o container WPPConnect acessível em `localhost:21465` com as variáveis de ambiente necessárias, conectado a uma rede Docker (`sirio-net`) que permita a comunicação com o container principal do Sirio.

### Requisitos
- Docker Desktop
- Node.js (já incluso na imagem)

### Variáveis de ambiente
- `PORT=21465`
- `TOKENAPI=defaultsecret`

### Como rodar
```bash
docker build -t sirio/wppconn .

# rede já deve existir: sirio-net
docker run -d \
  --name wppconnect-local \
  --network sirio-net \
  -p 21465:21465 \
  -e PORT=21465 \
  -e TOKENAPI=defaultsecret \
  sirio/wppconn
```

### Testes
Após subir, envie um POST para `http://localhost:21465/api/sirio/start-session` com o token gerado, e verifique o QR Code em base64.

### Observações
- Nenhuma lógica do Sirio é exposta neste container.
- Nenhuma tela administrativa ou dashboard do WPPConnect deve ser habilitada.
- Esta imagem serve apenas como **gateway de mensagens via WhatsApp**.

---

Você deve clonar este repositório, seguir as instruções e garantir que tudo funcione localmente.

Dúvidas? A comunicação será feita via Pull Request ou comentários diretos neste repositório.

---

> Preparado exclusivamente para integração com o backend Sirio. Nenhuma outra dependência necessária.
