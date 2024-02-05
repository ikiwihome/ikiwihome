# 构建应用
FROM node:18-alpine AS builder
RUN npm config set registry http://mirrors.cloud.tencent.com/npm/

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# 最小化镜像
FROM node:18-alpine
RUN npm config set registry http://mirrors.cloud.tencent.com/npm/
WORKDIR /app
COPY --from=builder /app/dist ./dist
RUN npm install -g http-server

EXPOSE 12445
CMD ["http-server", "dist", "-p", "12445"]