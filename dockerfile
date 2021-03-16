FROM debian
COPY test.s .
RUN apt-get update
RUN apt-get -y install gcc
RUN gcc -o test test.s -g
CMD ./test
