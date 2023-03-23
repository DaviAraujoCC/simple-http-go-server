FROM golang:1.18 AS builder

ADD .

RUN go build -o app main.go

FROM gcr.io/distroless/static-debian11:nonroot AS runner

COPY --from=builder /app /app

ENTRYPOINT ["/app"]
