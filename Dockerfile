FROM gliderlabs/alpine:3.1
ENTRYPOINT ["/bin/registrator"]
ENV GIT_HASH f1dff6c10b52dabaabbd1219ea46eef304e92115

ENV GOPATH /go

RUN apk-install -t build-deps go git mercurial && \
    git clone https://github.com/gliderlabs/registrator.git /go/src/github.com/gliderlabs/registrator && \
    cd /go/src/github.com/gliderlabs/registrator && \
    git checkout $GIT_HASH && \
    go get && \
    go build -ldflags "-X main.Version $(cat VERSION)" -o /bin/registrator 

#    rm -rf /go \
#    apk del --purge build-deps

