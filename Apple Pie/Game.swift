//
//  Game.swift
//  Apple Pie
//
//  Created by Student3 on 18/02/2025.
//

import Foundation

// Hold the State of the Game Inside `Game` struct

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    
    // Collection of characters that keep track of the selected letters
    var guessedLetters: [Character]
    
    // Method that receives a `Character`, adds it to the collection, an updates `incorrectMovesRemaining` if necessary
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
}
