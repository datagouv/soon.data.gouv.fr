FROM node:21 as builder

WORKDIR /app

COPY ./ /app

ENV NODE_OPTIONS=--openssl-legacy-provider

FROM nginx:alpine-slim

COPY --from=builder /app/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/www /app/dist
