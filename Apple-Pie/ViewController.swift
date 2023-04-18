//
//  ViewController.swift
//  Apple-Pie
//
//  Created by Ion Sebastian Rodriguez Lara on 18/04/23.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLoses = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateWorldState()
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            updateUI()
            enableButtons(true)
        } else {
            enableButtons(false)
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins) Loses: \(totalLoses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func updateWorldState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLoses += 1
        } else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func enableButtons(_ state: Bool) {
        for button in letterButtons {
            button.isEnabled = state
        }
    }
}

