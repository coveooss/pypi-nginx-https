FROM stevearc/pypicloud
MAINTAINER Coveo

ENV SERVERNAME pypi.corp.com

RUN apt-get update && apt-get install -y nginx augeas-tools

COPY files/pypi.conf /etc/nginx/sites-available/pypi.conf
RUN mkdir /files /certs
COPY /files /files
RUN chmod +x /files/entrypoint.sh

ENTRYPOINT ["/files/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]


