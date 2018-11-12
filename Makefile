all: hellomesh hellomeshctl
	@echo "build hellomesh successful!"

depend:
	go get github.com/golang/dep/cmd/dep
	dep ensure

hellomesh: depend
	go build ./src/hellomesh

hellomeshctl: depend
	go build ./src/hellomeshctl
