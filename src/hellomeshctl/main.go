package main

import (
	"github.com/zengyuxing007/hellomesh/src/hellomeshctl/command"
	"github.com/spf13/cobra"
)

var (
	rootCmd = &cobra.Command{
		Use:   "hellomeshctl",
		Short: "hellomesh is an example implementation of service mesh.",
	}
)

func init() {
	rootCmd.AddCommand(command.NewVersionCommand())
	rootCmd.AddCommand(command.NewServiceCommand())
}

func main() {
	if err := rootCmd.Execute(); err != nil {
		command.ExitWithError(err)
	}
}
