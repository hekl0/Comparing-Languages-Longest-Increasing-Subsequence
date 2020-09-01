package main

import (
	"fmt"
	"bufio"
	"os"
	"strings"
	"strconv"
)

const MAX_NUM = 100000

type Value struct {
	leng int
	index int
}

func input() []int {
	reader := bufio.NewReader(os.Stdin)
	text, _ := reader.ReadString('\n')
	
	var arr []int
	for _, i := range strings.Split(text[:len(text)-1], " ") {
		if i != "" {
			num, err := strconv.Atoi(i)
			if err != nil {
				panic(err)
			}
			arr = append(arr, num)
		}
	}

	return arr
}

func update(fenwick_tree []Value, index int, val Value) {
	for i := index; i <= MAX_NUM; i += i & -i {
		if fenwick_tree[i].leng < val.leng {
			fenwick_tree[i] = val
		}
	}
}

func get(fenwick_tree []Value, index int) Value {
	var res Value
	for i := index; i > 0; i -= i & -i {
		if res.leng < fenwick_tree[i].leng {
			res = fenwick_tree[i]
		}
	}
	return res
}

func printAns(arr []int, trace []Value, index int) {
	if trace[index].leng != 0 {
		printAns(arr, trace, trace[index].index)
	}
	fmt.Print(arr[index], " ")
}

func main() {
	var ans Value
	arr := input()
	
	fenwick_tree := make([]Value, MAX_NUM)
	trace := make([]Value, len(arr))
	for index, w := range arr {
		val := get(fenwick_tree, w-1)
		trace[index] = val

		new_val := Value{val.leng+1, index}

		update(fenwick_tree, w, new_val)

		if ans.leng < new_val.leng {
			ans = new_val
		}
	}
	
	printAns(arr, trace, ans.index)
	fmt.Println()
} 