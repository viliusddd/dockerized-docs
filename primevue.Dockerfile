# docker build -f ./primevue.Dockerfile -t primevue-docs:latest .
# docker run --name primevue-docs -dp 3014:3000 primevue-docs:latest

FROM node:20-alpine

WORKDIR /app

RUN npm install -g pnpm

RUN apk add --no-cache git && \
    git clone https://github.com/primefaces/primevue /app

RUN pnpm install

RUN pnpm run build

# RUN nuxi build

EXPOSE 3000

CMD ["pnpm", "run", "preview"]
