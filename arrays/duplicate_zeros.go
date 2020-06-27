package main

import (
	"fmt"
)

func main() {
	input := []int{0, 1, 0, 1}
	output := []int{0, 0, 1, 0}
	limit := len(input)
	temp := []int{}
	replace := false
	for i := 0; i < limit-1; i++ {
		if temp != 0 {
			input[i], temp = temp, input[i]
		}
		if input[i] == 0 {
			temp = input[i+1]
			input[i+1] = 0
			i++
		} else {
			temp = 0
		}
	}
}
