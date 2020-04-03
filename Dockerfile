FROM alpine:3.11

WORKDIR /workdir

RUN apk update
RUN apk add \
  bash \
  curl \
  vim \
  git

RUN wget https://github.com/fullstorydev/grpcurl/releases/download/v1.4.0/grpcurl_1.4.0_linux_x86_32.tar.gz -O grpcurl.tar.gz \
  && tar -xvf grpcurl.tar.gz \
  && mv grpcurl /usr/local/bin

RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl

RUN rm -rf /workdir

COPY ./bin/* /usr/local/bin/

WORKDIR /root
CMD ["/bin/bash"]
