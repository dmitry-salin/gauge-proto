#!/bin/sh

PATH=$PATH:$GOPATH/bin protoc -I=.. --go_out=. --go-grpc_out=. ../*.proto
rm -rf gauge_messages
mv github.com/dmitry-salin/gauge-proto/go/gauge_messages ./
rm -rf github.com
cd gauge_messages
go mod init github.com/dmitry-salin/gauge-proto/go/gauge_messages
go build ./...
