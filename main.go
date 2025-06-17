package main

import (
	"log"
	"time"
)

func main() {

	for true {
		log.Println("Hello World")
		time.Sleep(10 * time.Second)
	}

}
