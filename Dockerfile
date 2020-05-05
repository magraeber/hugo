FROM node

ARG VERSION=0.69.2

# Install Hugo
WORKDIR /usr/local/bin
ADD https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz .
ADD https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_checksums.txt .
RUN grep hugo_extended_${VERSION}_Linux-64bit.tar.gz hugo_${VERSION}_checksums.txt | sha256sum -c
RUN tar -zxf hugo_extended_${VERSION}_Linux-64bit.tar.gz
RUN ["hugo", "version"]
