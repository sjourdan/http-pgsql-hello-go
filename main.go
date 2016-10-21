package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

const (
	// Port to listen to
	Port = ":8080"
)

func serveDynamic(w http.ResponseWriter, r *http.Request) {
	name, err := os.Hostname()
	if err != nil {
		panic(err)
	}
	response := "The time is now " + time.Now().String() + "\nRunning on " + name
	fmt.Fprintln(w, response)
}

func main() {
	http.HandleFunc("/", serveDynamic)
	http.ListenAndServe(Port, nil)
}
