all:
	docker build -t grpc_cli .
	docker run grpc_cli
