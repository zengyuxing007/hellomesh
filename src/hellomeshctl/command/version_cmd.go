package command

import (
	"fmt"

	"github.com/zengyuxing007/hellomesh/src"
	"github.com/spf13/cobra"
)

func NewVersionCommand() *cobra.Command {
	return &cobra.Command{
		Use:   "version",
		Short: "Prints the version of hellomesh",
		Run:   versionCommandFunc,
	}
}

func versionCommandFunc(cmd *cobra.Command, args []string) {
	fmt.Println("hellomeshctl version:", src.HelloMeshVersion())
}
