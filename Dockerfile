FROM alpine:3.3

RUN apk --no-cache add \
      bash \
      ca-certificates \
      curl

ENV VAULT_VERSION=0.5.1
RUN cd /usr/local/bin && \
  curl -L -O "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" && \
  unzip vault_${VAULT_VERSION}_linux_amd64.zip && \
  rm vault_${VAULT_VERSION}_linux_amd64.zip

COPY files /
RUN chmod +x /etc/vault_wrapper

RUN adduser -u 9000 -D vault
RUN chown vault:vault /etc/vault.hcl /etc/vault_wrapper

USER vault

EXPOSE 8200

ENTRYPOINT ["/etc/vault_wrapper"]
CMD ["version"]
