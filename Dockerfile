FROM node:16.15.1 AS builder
WORKDIR /app
COPY . .
WORKDIR /app/App
RUN yarn $$ yarn build

FROM nginx
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --form=builder /app/App/build .
COPY nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT ['nginx','-g','daemon','off;']