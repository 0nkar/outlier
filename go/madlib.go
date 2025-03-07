package main

import (
	"encoding/json"
	"fmt"
	"math/rand"
	"os"
	"regexp"
	"time"
)

type Data struct {
	Nouns      []string  `json:"Nouns"`
	Numbers    []float64 `json:"Numbers"`
	Adjectives []string  `json:"Adjectives"`
}

func loadJSON(filename string) Data {
	file, _ := os.ReadFile(filename)
	var data Data
	json.Unmarshal(file, &data)
	return data
}

func getRandomIndex(length int) int {
	rand.Seed(time.Now().UnixNano())
	return rand.Intn(length)
}

func replaceWords(template string, data Data) string {
	nounRegex := regexp.MustCompile(`\(noun\)`)
	adjRegex := regexp.MustCompile(`\(adjective\)`)
	numRegex := regexp.MustCompile(`\(number\)`)
	template = nounRegex.ReplaceAllStringFunc(template, func(_ string) string {
		return data.Nouns[getRandomIndex(len(data.Nouns))]
	})
	template = adjRegex.ReplaceAllStringFunc(template, func(_ string) string {
		return data.Adjectives[getRandomIndex(len(data.Adjectives))]
	})
	template = numRegex.ReplaceAllStringFunc(template, func(_ string) string {
		return fmt.Sprintf("%g", data.Numbers[getRandomIndex(len(data.Numbers))])
	})
	return template
}

func main() {
	data := loadJSON("data.json")
	template, _ := os.ReadFile("madlib.txt")
	result := replaceWords(string(template), data)
	fmt.Println(result)
}
