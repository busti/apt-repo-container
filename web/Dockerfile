FROM nginx

EXPOSE 80

ADD config.nginx /etc/nginx/nginx.conf

VOLUME /htdocs

CMD ["nginx", "-g", "daemon off;"]