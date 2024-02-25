FROM nginx:latest
COPY default.conf /etc/nginx/conf.d/ha.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80
