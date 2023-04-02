# FROM nginx
# COPY ./dist /usr/share/nginx/html

FROM node:current-alpine AS builder

WORKDIR /root

COPY . /root/

RUN yarn

RUN yarn build

FROM nginx

COPY --from=builder /root/dist /usr/share/nginx/html
