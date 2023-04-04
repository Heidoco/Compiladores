package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

func bubbleSort(arr []int) []int {
	n := len(arr)
	swapped := true
	for swapped {
		swapped = false
		for i := 0; i < n-1; i++ {
			if arr[i] > arr[i+1] {
				arr[i], arr[i+1] = arr[i+1], arr[i]
				swapped = true
			}
		}
		n--
	}
	return arr
}

func readInputFile(filename string) ([]int, error) {
	content, err := ioutil.ReadFile(filename)
	if err != nil {
		return nil, err
	}

	lines := strings.Split(string(content), "\n")
	var arr []int
	for _, line := range lines {
		num, err := strconv.Atoi(line)
		if err != nil {
			continue
		}
		arr = append(arr, num)
	}

	return arr, nil
}

func writeOutputFile(filename string, arr []int) error {
	var lines []string
	for _, num := range arr {
		lines = append(lines, strconv.Itoa(num))
	}

	content := []byte(strings.Join(lines, "\n"))
	err := ioutil.WriteFile(filename, content, 0644)
	if err != nil {
		return err
	}

	return nil
}

func main() {
	// read input file
	inputFilename := "input.txt"
	arr, err := readInputFile(inputFilename)
	if err != nil {
		fmt.Printf("Failed to read input file: %v\n", err)
		os.Exit(1)
	}

	// sort array
	sortedArr := bubbleSort(arr)

	// write output file
	outputFilename := "output.txt"
	err = writeOutputFile(outputFilename, sortedArr)
	if err != nil {
		fmt.Printf("Failed to write output file: %v\n", err)
		os.Exit(1)
	}
}
