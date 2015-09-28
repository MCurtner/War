//
//  ViewController.swift
//  War
//
//  Created by Matthew Curtner on 9/28/15.
//  Copyright © 2015 Matthew Curtner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    
    var allCardsArray = [String]()
    var player1ScoreTotal = 0
    var player2ScoreTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add all cards to allCardsArray
        
        addCardsToArray(letter1: "H", letter2: "C", letter3: "D", letter4: "S")
        
        for cards in allCardsArray {
            print(cards)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Methods
    
    // Add card names to Array
    
    func addCardsToArray(letter1 letter1:String, letter2: String, letter3: String, letter4: String) {
        for index in 2...10 {
            self.allCardsArray.append("\(index)_\(letter1)")
            self.allCardsArray.append("\(index)_\(letter2)")
            self.allCardsArray.append("\(index)_\(letter3)")
            self.allCardsArray.append("\(index)_\(letter4)")
        }
    }
    
    // Remove all non numerical characters from string
    
    func getNumbersFromString(theString theString: String) -> Int {
        
        var strVal = theString
        strVal = strVal.stringByReplacingOccurrencesOfString(
            "\\D", withString: "", options: .RegularExpressionSearch,
            range: strVal.startIndex..<strVal.endIndex)
        
        return Int(strVal)!
    }
    
    // MARK - Actions
    
    @IBAction func playRoundTapped(sender: UIButton) {
        //self.playRoundButton.setTitle("Play Round", forState: UIControlState.Normal)
        
        let firstRandomNumber = arc4random_uniform(33) + 1
        print("firstRandom: \(firstRandomNumber)")
        let firstCardString = String(format: "%@", allCardsArray[Int(firstRandomNumber)])
        
        let secondRandomNumber = arc4random_uniform(33) + 1
        print("secondRandom: \(secondRandomNumber)")

        let secondCardString = String(format: "%@", allCardsArray[Int(secondRandomNumber)])
        
        self.firstCardImageView.image = UIImage(named: firstCardString)
        self.secondCardImageView.image = UIImage(named: secondCardString)
        
        let firstCardValue: Int = getNumbersFromString(theString: firstCardString)
        let secondCardValue: Int = getNumbersFromString(theString: secondCardString)

        
        // Logic for scoring
        if firstCardValue > secondCardValue {
            //First card is larger so add 1
            player1ScoreTotal += 1
            player1Score.text = String(player1ScoreTotal)
            
        } else if firstCardValue == secondCardValue {
            // Do nothing as the cards are the same
        } else {
            player2ScoreTotal += 1
            player2Score.text = String(player2ScoreTotal)
        }

    }
    
    
    
}

