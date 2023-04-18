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
    
    var totalWins = 0
    var totalLoses = 0
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var scoreLabel: UIStackView!
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    func newRound() {
        
    }
}

