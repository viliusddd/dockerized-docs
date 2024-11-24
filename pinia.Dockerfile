# docker build -f ./pinia.Dockerfile -t pinia-docs:latest .
# docker run --name pinia-docs -p 3005:5173 pinia-docs:latest

FROM node:20-alpine

WORKDIR /app

RUN npm install -g pnpm

RUN apk add --no-cache git && \
    git clone https://github.com/vuejs/pinia.git /app

RUN pnpm install

EXPOSE 5173

# CMD ["pnpm", "run", "docs", "--host"]
CMD ["pnpm", "run", "docs"]
