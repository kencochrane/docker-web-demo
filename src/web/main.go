package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func index(w http.ResponseWriter, r *http.Request) {
	Host, _ := os.Hostname()
	fmt.Fprintf(w, "Container: %v\n", Host)
	fmt.Printf("Request: %s [%s]\n", r.UserAgent(), r.RemoteAddr)
}

func main() {
	http.HandleFunc("/", index)

	err := http.ListenAndServe(":80", nil) // set listen port
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
