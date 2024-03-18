FROM gcc AS build
RUN apt-get update && apt-get install -y flex
WORKDIR /src/
COPY test*.l /src/
RUN make LDFLAGS=-static test1 test2 test3

FROM scratch  as test
COPY --from=build /src/test* .
COPY ./test.txt ./test.txt
