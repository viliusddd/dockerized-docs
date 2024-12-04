# docker build -f ./mdn-web-docs.Dockerfile -t mdn-web-docs-docs:latest .
# docker run --name mdn-web-docs-docs -dp 3011:5042 mdn-web-docs-docs:latest

FROM node:20

WORKDIR /app


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN git clone https://github.com/mdn/content /app

RUN yarn install

RUN yarn build

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

ENV NVM_DIR /usr/local/nvm

EXPOSE 5042

CMD ["yarn", "start"]
