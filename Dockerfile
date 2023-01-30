# syntax=docker/dockerfile:1

FROM golang:1.19-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /demo-gitops-api

## Deploy
FROM gcr.io/distroless/base-debian10:nonroot AS final

WORKDIR /

COPY --from=build /demo-gitops-api /demo-gitops-api

EXPOSE 1323

USER nonroot:nonroot

ENTRYPOINT ["/demo-gitops-api"]