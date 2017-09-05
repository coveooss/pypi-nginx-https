# pypi-nginx-https

This docker will setup an pypi server behind an https proxy served by nginx.

## Setup

You have to configure the SERVERNAME env variable to match your domain name.

```bash
docker create -name pypi -e SERVERNAME=test.domain.com quay.io/coveo/pypi-https
```

### Certificates

Https certificates are stored in /certs, and are automatically created during the startup.
You could mount volume to use your own certificates but they will have to be named $SERVERNAME.crt and $SERVERNAME.key 
