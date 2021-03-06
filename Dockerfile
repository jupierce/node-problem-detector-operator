FROM registry.svc.ci.openshift.org/openshift/release:golang-1.10 AS builder
WORKDIR /go/src/github.com/openshift/node-problem-detector-operator
COPY . .
RUN go build ./cmd/node-problem-detector-operator

FROM registry.svc.ci.openshift.org/openshift/origin-v4.0:base
COPY --from=builder /go/src/github.com/openshift/node-problem-detector-operator/node-problem-detector-operator /usr/bin/
