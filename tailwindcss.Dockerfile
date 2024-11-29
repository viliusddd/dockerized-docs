# docker build -f ./tailwindcss.Dockerfile -t tailwindcss-docs:latest .
# docker run --name tailwindcss-docs -dp 3010:3000 tailwindcss-docs:latest

FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache git chromium && \
    git clone https://github.com/tailwindlabs/tailwindcss.com /app

RUN npm i

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
