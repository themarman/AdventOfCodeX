package main

import (
	"fmt"
	"io/ioutil"
	"log"
)

func main() {
	data, err := ioutil.ReadFile("input.txt")
	if err != nil {
		log.Fatal("Error reading file:", err)
	}

	floor := 0
	for i := 0; i < len(data); i++ {
		if data[i] == '(' {
			floor++
		} else if data[i] == ')' {
			floor--
		}
	}

	fmt.Println("Santa ended up on floor:", floor)
}
