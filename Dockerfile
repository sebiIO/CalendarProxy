FROM golang:1.20-alpine3.17 as builder

RUN apk update && apk add --no-cache tzdata alpine-sdk bash

WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 go build -ldflags="-extldflags=-static" -o /proxy cmd/proxy/proxy.go

FROM scratch

COPY --from=builder /proxy /proxy

EXPOSE 80

CMD ["/proxy"]
