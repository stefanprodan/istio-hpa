FROM golang:1.11

RUN mkdir -p /zalando-incubator/
WORKDIR /zalando-incubator

RUN git clone https://github.com/zalando-incubator/kube-metrics-adapter
WORKDIR /zalando-incubator/kube-metrics-adapter

RUN rm go.sum
RUN go mod download
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -a -installsuffix cgo -o kube-metrics-adapter .

FROM alpine:3.8

RUN apk --no-cache add ca-certificates

COPY --from=0 /zalando-incubator/kube-metrics-adapter/kube-metrics-adapter .

ENTRYPOINT ["./kube-metrics-adapter"]
