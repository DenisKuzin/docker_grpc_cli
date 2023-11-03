FROM ubuntu:22.04
RUN apt update && apt install -y build-essential git cmake
RUN git clone https://github.com/grpc/grpc
WORKDIR /grpc
RUN git submodule update --init
RUN mkdir -p cmake/build
WORKDIR /grpc/cmake/build
RUN cmake -DgRPC_BUILD_TESTS=ON ../..
RUN make grpc_cli
CMD ["./grpc_cli", "help"]
