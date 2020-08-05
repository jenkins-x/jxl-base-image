#!/bin/bash

echo "promoting the new version ${VERSION} to downstream repositories"

jx step create pr regex --regex "(?m)^FROM gcr.io/jenkinsxio-labs-private/jxl-base:(?P<version>.*)$" --version ${VERSION} --files Dockerfile --repo https://github.com/jenkins-x/jx-cli.git

jx step create pr regex --regex "(?m)^FROM gcr.io/jenkinsxio-labs-private/jxl-base:(?P<version>.*)$" --version ${VERSION} --files Dockerfile --repo https://github.com/jenkins-x/jx-promote.git

jx step create pr regex --regex "(?m)^FROM gcr.io/jenkinsxio-labs-private/jxl-base:(?P<version>.*)$" --version ${VERSION} --files Dockerfile --repo https://github.com/jenkins-x/jxl-base-image-jx.git
