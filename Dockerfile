# usage: docker run cpuminer:v1 -a scrypt -o stratum+tcp:miningpool.url:port -u username -p password

FROM alpine:3.7
WORKDIR /code
RUN apk --no-cache add autoconf automake build-base curl curl-dev openssl-dev zlib-dev make git \
    && git clone https://github.com/whosy/cpuminer-multi.git \
    && cd /code/cpuminer-multi \
    && ./autogen.sh \
    && ./configure CFLAGS="-O3 -march=native" --with-crypto --with-curl \
    && make \
    && cp /code/cpuminer-multi/cpuminer /usr/bin
ENTRYPOINT ["cpuminer"]
