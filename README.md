# Sirio WPPConnect Gateway

Gateway Dockerizado do servidor WPPConnect para integrar com o backend Sirio.

---

## 🔧 Variáveis de Ambiente

A autenticação da API é feita por token.

- `TOKENAPI=defaultsecret`

---

## 🚀 Como testar

Após o container estar rodando, o seguinte endpoint deve funcionar:

### Endpoint:

```
POST http://localhost:21465/api/sirio/start-session
```

### Headers:

```
Authorization: Bearer defaultsecret  
Content-Type: application/json
```

### Body:

```json
{
  "webhook": "",
  "session": "sirio"
}
```

### Esperado:

Resposta com status `200 OK` e corpo contendo:

```json
{
  "status": "QRCODE",
  "qrcode": "data:image/png;base64,..."
}
```
