FROM golang:1.23.3
MAINTAINER Frank R <12985912+fritchie@users.noreply.github.com>

RUN apt-get update && apt-get -y --no-install-recommends install nvme-cli && apt-get autoremove

WORKDIR /go/src/nvme_exporter
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

EXPOSE 9998

CMD [ "nvme_exporter" ]
