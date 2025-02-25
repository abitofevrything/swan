ARG ARCH
FROM --platform=$ARCH ubuntu
RUN apt-get update && apt-get install -y libsqlite3-dev ca-certificates
ARG BINARY
COPY $BINARY /app
ENTRYPOINT ["/app"]
