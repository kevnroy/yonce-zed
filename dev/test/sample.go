package main

import (
	"fmt"
	"strings"
)

// Song is a track with play counts.
type Song struct {
	Title string
	Plays int
}

func (s Song) Label() string {
	return fmt.Sprintf("%s (%d)", strings.ToUpper(s.Title), s.Plays)
}

func main() {
	songs := []Song{{"Formation", 42}, {"Halo", 7}}
	for i, song := range songs {
		if song.Plays > 10 {
			fmt.Printf("%d: %s\n", i, song.Label())
		}
	}
}
