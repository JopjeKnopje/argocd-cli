FROM debian:bullseye-slim


ARG ARGOCLI_VERSION=v3.0.1
ENV ARGOCLI_VERSION=${ARGOCLI_VERSION}

RUN set -ex \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y curl  ca-certificates\
    && apt-get clean

RUN set -ex \
    && curl -sSL -o argocd-linux-amd64 "https://github.com/argoproj/argo-cd/releases/download/${ARGOCLI_VERSION}/argocd-linux-amd64" \
    && install -m 555 argocd-linux-amd64 /usr/local/bin/argocd \
    && rm argocd-linux-amd64

ENTRYPOINT ["argocd"]
