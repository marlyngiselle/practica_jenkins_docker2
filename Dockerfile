FROM nginx:latest

LABEL maintainer="marlyn.dcr@gmail.com"

WORKDIR /usr/share/nginx/html

COPY ./univers/ .

EXPOSE 80
