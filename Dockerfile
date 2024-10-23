FROM golang AS builder
ARG GOOGLE_VERSION=v1.5.8
RUN mkdir /nonexistent && chmod 777 /nonexistent
USER nobody:nogroup
RUN git clone -b $GOOGLE_VERSION https://github.com/3052/google /nonexistent/google && \
    cd /nonexistent/google && \
    go env -w GO111MODULE=on && \
    go mod tidy && \
    go mod download && \
    cd internal/play/ && \
    CGO_ENABLED=0 go build

FROM alpine
ARG UID=1000
ARG GID=1000
COPY --chown=0:0 --chmod=755 --from=builder /nonexistent/google/internal/play/play /usr/local/bin
RUN mkdir /google && \
    chown "$UID:$GID" /google
USER $UID:$GID
WORKDIR /google
ENTRYPOINT ["/usr/local/bin/play"]
