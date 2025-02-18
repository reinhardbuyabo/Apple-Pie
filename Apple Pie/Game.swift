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
    
    // Computed Property
    // - Begin with an empty string
    // - Loop through each characger of `word`
    // - If the character is in `guessedLetters`, convert it to a string, then append the letter onto the variable
    // - Otherwise, append _ onto the variable
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        
        return guessedWord
    }
    
    // Method that receives a `Character`, adds it to the collection, an updates `incorrectMovesRemaining` if necessary
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
}
