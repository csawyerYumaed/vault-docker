FROM centurylink/ca-certs 
EXPOSE 8200
COPY bin/vault /
COPY vault.hcl /
COPY server.crt /
COPY server.key /
ENTRYPOINT ["/vault"]
