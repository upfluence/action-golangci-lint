FROM golangci/golangci-lint:v1.35-alpine

ENV REVIEWDOG_VERSION=v0.11.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b $(go env GOPATH)/bin ${REVIEWDOG_VERSION} 

COPY entrypoint.sh /entrypoint.sh
COPY golangci.yml /golangci.yml

ENTRYPOINT ["/entrypoint.sh"]
