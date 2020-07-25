FROM golang:1.13-alpine AS build

WORKDIR /src/
COPY main.go /src/
RUN go build -o /bin/hello

FROM scratch
COPY --from=build /bin/hello /bin/hello
ENTRYPOINT ["/bin/hello"]
