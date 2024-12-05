# docker build -f ./typescript.Dockerfile -t typescript-docs:latest .
# docker run --name typescript-docs -dp 3015:8000 typescript-docs:latest

FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache git curl && \
    git clone https://github.com/microsoft/TypeScript-Website /app

RUN curl -L https://unpkg.com/@pnpm/self-installer | node

RUN pnpm install

RUN pnpm bootstrap

EXPOSE 8000

CMD ["pnpm", "start"]
