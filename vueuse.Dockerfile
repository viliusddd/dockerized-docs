# docker build -f ./vueuse.Dockerfile -t vueuse-docs:latest .
# docker run --name vueuse-docs -dp 3008:4173 vueuse-docs:latest

FROM node:20-alpine

WORKDIR /app

RUN npm install -g pnpm

RUN apk add --no-cache git && \
    git clone https://github.com/vueuse/vueuse /app

RUN pnpm install
RUN pnpm run docs:build

EXPOSE 4173

CMD ["pnpm", "run", "docs:serve"]
