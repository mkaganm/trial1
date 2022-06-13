FROM golang:1.18.3-alpine3.16 as builder

WORKDIR /app

ENV CGO_BUILD=0
ENV GOOS=linux
ENV GOARCH=arm64



COPY . .

RUN go build main.go

FROM alpine

COPY --from=builder app/main app/main

CMD ["./app/main"]

 