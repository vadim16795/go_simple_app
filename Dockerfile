# syntax=docker/dockerfile:1
FROM golang:1.18-alpine as builder
LABEL stage=builder
WORKDIR /app
COPY . .
RUN go build -o main main.go
FROM alpine:3.13
WORKDIR /app
COPY --from=builder /app/main .
EXPOSE 8080
CMD [ "/app/main" ]