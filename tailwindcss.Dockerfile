# docker build -f ./tailwindcss.Dockerfile -t tailwindcss-docs:latest .
# docker run --name tailwindcss-docs -dp 3010:3000 tailwindcss-docs:latest

FROM node:20-alpine AS builder

WORKDIR /app

RUN apk add --no-cache git chromium && \
    git clone https://github.com/tailwindlabs/tailwindcss.com /app

RUN npm i --only=production

RUN npm run build

FROM node:20-alpine AS runtime

WORKDIR /app

COPY --from=builder /app/node_modules/ ./node_modules/
COPY --from=builder /app/.next/ ./.next/
COPY --from=builder /app/package*.json ./

EXPOSE 3000

CMD ["npm", "run", "start"]
