ARG ARCH

FROM --platform=$ARCH dart:stable AS build

WORKDIR /swan
COPY . .
RUN dart pub get

RUN dart compile exe bin/main.dart -o app

FROM --platform=$ARCH ubuntu

RUN apt-get update && apt-get install -y libsqlite3-dev ca-certificates

COPY --from=build /swan/app /app

ENTRYPOINT ["/app"]
