//
//  ViewController.swift
//  Apple Pie
//
//  Created by Reinhard Buyabo on 15/02/2025.
//

import UIKit

class ViewController: UIViewController {
    // list of words
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program", "chess", "football", "nfl", "superbowl", "grammy", "uikit"]
    // Incorrect guesses allowed per round
    let incorrecctMovesAllowed = 7
    
    // property that holds the current game:
    var currentGame: Game! // between app launch and beginning of first round, this variable of type `Game` is nil
    
    // Count of the Number of Wins and Losses
    var totalWins = 0
    var totalLosses = 0
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        newRound()
    }


    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        // Not all buttons have configurations or titles
        let letterString = sender.configuration!.title! // all buttons have configurations that have titles
        let letter = Character(letterString.lowercased()) // lowercase then convert Str -> Char
        currentGame.playerGuessed(letter: letter)
    }
    
    func newRound(){
        // Each round begins with the selection of a new word
        // Reset the number of moves the player can make to `incorrectMovesAllowed`
        
        let newWord = listOfWords.removeFirst()
        // Instance of Game
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrecctMovesAllowed, guessedLetters: []) // initially guessedLetters is an empty Collection
        
        updateUI()
    }
    
    func updateUI(){
        // handles interface updates
        
        // 4. Spacing of the guess
        var letters = [String]() // constructor call
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ") // space as separator
        
        // 3. `formattedWord` is a now a property that we can display in UI
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        // 2. Image View
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}
