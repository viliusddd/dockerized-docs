# docker build -f ./vuejs.Dockerfile -t vuejs-docs:latest .
# docker run --name vuejs-docs -dp 3004:4173 vuejs-docs:latest

FROM node:20-alpine

WORKDIR /app

RUN npm install -g pnpm

RUN apk add --no-cache git && \
    git clone https://github.com/vuejs/docs.git /app

RUN pnpm install

RUN pnpm run build

EXPOSE 4173

CMD ["pnpm", "run", "preview"]
