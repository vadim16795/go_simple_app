# syntax=docker/dockerfile:1
FROM golang:1.16-alpine
WORKDIR /app
COPY . .
RUN go build -o main main.go
EXPOSE 8080
CMD [ "/app/main" ]