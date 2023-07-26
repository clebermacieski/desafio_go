FROM golang as builder

COPY ./hello.go ./src

WORKDIR /go/src

RUN go mod init example/hello && \
    go build -o .

FROM scratch
COPY --from=builder /go/src/hello .

ENTRYPOINT [ "./hello" ]