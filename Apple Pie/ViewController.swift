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
    }
    
    func newRound(){
        // Each round begins with the selection of a new word
        // Reset the number of moves the player can make to `incorrectMovesAllowed`
        
        let newWord = listOfWords.removeFirst()
        // Instance of Game
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrecctMovesAllowed)
        
        updateUI()
    }
    
    func updateUI(){
        // handles interface updates
        
        // 1. Score Label
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        // 2. Image View
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}
