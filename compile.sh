#!/bin/bash

set -e

cd /go/src/web
go build
cp web /go/bin
