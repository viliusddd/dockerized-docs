FROM node:20-alpine

WORKDIR /app

RUN npm install -g pnpm

RUN apk add --no-cache git && \
    git clone https://github.com/vitest-dev/vitest /app

RUN pnpm install
RUN pnpm run ci:docs

EXPOSE 4173

CMD ["pnpm", "run", "docs:serve"]
