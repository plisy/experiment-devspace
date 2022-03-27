FROM golang:1.17 AS builder

WORKDIR /app

ADD ["go.mod", "go.sum", "./"] 

RUN go mod download

ADD ./ ./

RUN go build -o ./bin/ ./cmd/...

FROM ubuntu

COPY --from=builder /app/bin /usr/local/bin/
