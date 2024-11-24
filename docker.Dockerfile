# docker build -f ./docker.Dockerfile -t docker-docs:latest .
# docker run --name docker-docs -dp 1313:1313 docker-docs:latest
# ATENTION: HOST_PORT:CONTAINER_PORT should match to avoid issues in displaying pages

FROM hugomods/hugo:0.139.2


WORKDIR /app

RUN apk add --no-cache git && \
    git clone https://github.com/docker/docs.git /app

RUN npm install

EXPOSE 1313

CMD ["hugo", "server", "--bind", "0.0.0.0", "--disableLiveReload"]
