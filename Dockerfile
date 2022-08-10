# 指明所基于的镜像名称
# 第一条指令必须为 FROM 指令
FROM node:16.15.1 AS builder

# 配置工作目录
WORKDIR /app

# COPY <src> <dest>
# 复制本地主机src到容器中的dest
COPY . .

WORKDIR /app/App

# 对镜像执行跟随的命令
# 每运行一条 RUN 命令，镜像添加新的一层
RUN yarn install && yarn build

FROM nginx
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/build .
COPY nginx.conf /etc/nginx/nginx.conf

# entrypoint
# nginx -g daemon off
ENTRYPOINT ['nginx','-g','daemon','off;']