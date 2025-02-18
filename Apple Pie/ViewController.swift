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
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
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
        
        updateGameState()
    }
    
    func newRound(){
        // Each round begins with the selection of a new word
        // Reset the number of moves the player can make to `incorrectMovesAllowed`
        
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(
                word: newWord,
                incorrectMovesRemaining: incorrecctMovesAllowed,
                guessedLetters: []
            )
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
        
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
    
    func updateGameState() {
        // A Game is lost if `incorrectMovesRemaining` reaches 0
        // When it does increment `totalLosses`
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
}
