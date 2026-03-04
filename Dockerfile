# ── Etapa 1: Build ────────────────────────────────────────────────────────────
FROM node:20-alpine AS base

# Diretório de trabalho dentro do container
WORKDIR /app

# Copia apenas os arquivos de dependências primeiro (melhor cache do Docker)
COPY package*.json ./

# Instala dependências de produção apenas
RUN npm ci --only=production

# ── Etapa 2: App ──────────────────────────────────────────────────────────────
FROM node:20-alpine

WORKDIR /app

# Copia dependências instaladas
COPY --from=base /app/node_modules ./node_modules

# Copia o código-fonte
COPY . .

# Cria pasta public se não existir
RUN mkdir -p public

# Expõe a porta da API
EXPOSE 3000

# Variáveis de ambiente padrão (sobrescritas pelo docker-compose)
ENV NODE_ENV=production
ENV PORT=3000

# Comando de inicialização
CMD ["node", "src/server.js"]
