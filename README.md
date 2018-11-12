# HelloMesh

A test example for servicemesh


## local build

./make all


## Example

=======
Docker example
=======
Docker exapmle starts containers and build hellomesh binary from local source code.
```
go get github.com/zengyuxing007/hellomesh
go get github.com/golang/dep/cmd/dep
cd $GOPATH/src/github.com/zengyuxing007/hellomesh
dep ensure
cd ./examples/docker
# run.sh starts all of the relevant containers and register example services.
./run.sh
```
