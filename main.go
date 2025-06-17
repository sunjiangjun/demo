package main

import (
	"github.com/sunjiangjun/xlog"
	"time"
)

func main() {

	x := xlog.NewXLogger()
	for true {
		x.Println("Hello World")
		time.Sleep(10 * time.Second)
	}

}
