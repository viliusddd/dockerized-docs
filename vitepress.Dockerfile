# docker build -f ./vitepress.Dockerfile -t vitepress:latest .
# docker run --name vitepress -dp 3021:4173 vitepress:latest

FROM node:20-alpine AS builder

WORKDIR /app

RUN npm install -g pnpm

RUN apk add --no-cache git && \
    git clone https://github.com/vuejs/vitepress /app

RUN pnpm install && \
    pnpm run build && \
    pnpm run docs:build

EXPOSE 4173

CMD ["pnpm", "run", "docs:preview"]
