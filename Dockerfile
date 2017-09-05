FROM stevearc/pypicloud
MAINTAINER Coveo

ENV SERVERNAME pypi.corp.com

RUN apt-get update && apt-get install -y nginx augeas-tools supervisor

COPY files/pypi.conf /etc/nginx/sites-available/pypi.conf
RUN mkdir /install /certs
COPY files/install /install
COPY files/supervisord /etc/supervisor
RUN chmod +x /files/entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/files/entrypoint.sh"]
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]


