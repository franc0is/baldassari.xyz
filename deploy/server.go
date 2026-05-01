package main

import (
	"log"
	"net/http"
)

func main() {
	http.Handle("/", http.FileServer(http.Dir("/opt/app/public")))
	log.Fatal(http.ListenAndServe(":8000", nil))
}
