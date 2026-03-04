# 🏥 Plantão Pré-Op API

> API REST para passagem de plantão pré-operatório — Node.js, PostgreSQL, JWT

---

## 🚀 Rodar com Docker (1 comando)

```bash
git clone https://github.com/SEU_USUARIO/plantao-api.git
cd plantao-api
cp .env.example .env
docker compose up --build
```

Acesse **http://localhost:3000**
Login: `admin@hospital.local` / `Admin@1234`

---

## 💻 Rodar sem Docker

```bash
npm install
cp .env.example .env
npm run migrate
npm run seed
npm run dev
```

---

## 🐳 Comandos Docker

```bash
docker compose up -d          # sobe em background
docker compose logs -f api    # ver logs da API
docker compose down           # para tudo
docker compose down -v        # para e apaga dados
docker compose up --build     # rebuild após mudanças
```

---

## 🔗 Endpoints principais

| Método | Rota | Auth |
|--------|------|------|
| POST | `/auth/login` | ❌ |
| GET | `/plantoes` | ✅ |
| POST | `/plantoes` | ✅ |
| GET | `/plantoes/:id/resumo` | ✅ |
| PATCH | `/plantoes/:id/status` | ✅ |
| DELETE | `/plantoes/:id` | ✅ admin |

---

Desenvolvido por **Luana** — TCC 2026
