package main

import (
	"github.com/sebiio/calendar-proxy/internal"
	"log"
)

func main() {
	app := &internal.App{}
	log.Println(app.Run())
}
