# codeclimate-vault

Dockerized version of vault with consul backend

## Instructions

Build the image as per usual:

```console
$ docker build -t codeclimate/vault .
```

```console
$ docker run \
  --log-driver syslog \
  --log-opt tag=vault \
  --net host \
  --publish 8200:8200 \
  codeclimate/vault server -config=/etc/vault.hcl
```
