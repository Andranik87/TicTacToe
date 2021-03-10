//
//  ViewController.swift
//  TicTacToe
//
//  Created by Andranik Karapetyan on 4/15/20.
//  Copyright © 2020 Andranik Karapetyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonCell11: UIButton!
    @IBOutlet weak var buttonCell12: UIButton!
    @IBOutlet weak var buttonCell13: UIButton!
    @IBOutlet weak var buttonCell21: UIButton!
    @IBOutlet weak var buttonCell22: UIButton!
    @IBOutlet weak var buttonCell23: UIButton!
    @IBOutlet weak var buttonCell31: UIButton!
    @IBOutlet weak var buttonCell32: UIButton!
    @IBOutlet weak var buttonCell33: UIButton!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var background: UIImageView!
    
    var player = 1
    var addedValue = 0;
    var cellValue = 0;
    var cellValues = [0, 0, 0, 0, 0, 0, 0, 0]
    var buttonsList = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttonsList.append(buttonCell11)
        buttonsList.append(buttonCell12)
        buttonsList.append(buttonCell13)
        buttonsList.append(buttonCell21)
        buttonsList.append(buttonCell22)
        buttonsList.append(buttonCell23)
        buttonsList.append(buttonCell31)
        buttonsList.append(buttonCell32)
        buttonsList.append(buttonCell33)
        
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        self.view.backgroundColor = UIColor.gray
    }

    
    @IBAction func cell11(_ sender: Any) {
        cellValue = 1
        setSymbol(button: buttonCell11)
        cellValues[0] += markValue()
        cellValues[3] += markValue()
        cellValues[6] += markValue()
        buttonCell11.isUserInteractionEnabled = false
        print (cellValues)
        changePlayer()
        checkForGameOver()
    }
    @IBAction func cell12(_ sender: Any) {
        cellValue = 2
        setSymbol(button: buttonCell12)
        cellValues[0] += markValue()
        cellValues[4] += markValue()
        buttonCell12.isUserInteractionEnabled = false
        print (cellValues)
        changePlayer()
        checkForGameOver()
    }
    @IBAction func cell13(_ sender: Any) {
        cellValue = 3
        setSymbol(button: buttonCell13)
        cellValues[0] += markValue()
        cellValues[5] += markValue()
        cellValues[7] += markValue()
        buttonCell13.isUserInteractionEnabled = false
        print (cellValues)
        changePlayer()
        checkForGameOver()
    }
    
    @IBAction func cell21(_ sender: Any) {
        cellValue = 1
        setSymbol(button: buttonCell21)
        cellValues[1] += markValue()
        cellValues[3] += markValue()
        buttonCell21.isUserInteractionEnabled = false
        print (cellValues)
        changePlayer()
        checkForGameOver()
    }
    @IBAction func cell22(_ sender: Any) {
        cellValue = 2
        setSymbol(button: buttonCell22)
        cellValues[1] += markValue()
        cellValues[4] += markValue()
        cellValues[6] += markValue()
        cellValues[7] += markValue()
        buttonCell22.isUserInteractionEnabled = false
        print (cellValues)
        changePlayer()
        checkForGameOver()
    }
    @IBAction func cell23(_ sender: Any) {
        cellValue = 3
        setSymbol(button: buttonCell23)
        cellValues[1] += markValue()
        cellValues[5] += markValue()
        buttonCell23.isUserInteractionEnabled = false
        print (cellValues)
        changePlayer()
        checkForGameOver()
    }
    
    
    @IBAction func cell31(_ sender: Any) {
        cellValue = 1
        setSymbol(button: buttonCell31)
        cellValues[2] += markValue()
        cellValues[3] += markValue()
        cellValues[7] += markValue()
        buttonCell31.isUserInteractionEnabled = false
        print (cellValues)
        changePlayer()
        checkForGameOver()
    }
    @IBAction func cell32(_ sender: Any) {
        cellValue = 2
        setSymbol(button: buttonCell32)
        cellValues[2] += markValue()
        cellValues[4] += markValue()
        buttonCell32.isUserInteractionEnabled = false
        print (cellValues)
        changePlayer()
        checkForGameOver()
    }
    @IBAction func cell33(_ sender: Any) {
        cellValue = 3
        setSymbol(button: buttonCell33)
        cellValues[2] += markValue()
        cellValues[5] += markValue()
        cellValues[6] += markValue()
        buttonCell33.isUserInteractionEnabled = false
        print (cellValues)
        changePlayer()
        checkForGameOver()
    }
    
    @IBAction func Retry(_ sender: Any) {
        gameOverLabel.text = ""
        toggleGameplay(isOn: true)
        retryButton.isEnabled = false;
        retryButton.setTitle("", for: [])
        player = 1
        
        for button in buttonsList
        {
            button.setBackgroundImage(nil, for: [])
        }
        
        for (index, value) in cellValues.enumerated()
        {
            cellValues[index] = 0
        }
    }
    
    func markValue() -> Int
    {
        return addedValue
    }
    
    func setSymbol(button: UIButton)
    {
        if player == 1
        {
            addedValue = 1
            button.setBackgroundImage(UIImage(named: "x.png"), for: [])
        }
        else if player == 2
        {
            addedValue = 10
            button.setBackgroundImage(UIImage(named: "o.png"), for: [])
        }
    }
    
    func changePlayer()
    {
        if player == 1
        {
            player = 2
        }
        else if player == 2
        {
            player = 1
        }
    }
    
    func toggleGameplay(isOn: Bool)
    {
        for button in buttonsList
        {
            button.isUserInteractionEnabled = isOn
        }
    }
    
    func checkForGameOver()
    {
        var isGameOver = false;
        for value in cellValues
        {
            if value == 3
            {
                isGameOver = true;
                gameOverLabel.text = "Congradulations. Player 1 Wins!"
            }
            else if value == 30
            {
                isGameOver = true;
                gameOverLabel.text = "Congradulations. Player 2 Wins!"
            }
            else
            {
                var i = 0
                for button in buttonsList
                {
                    if !button.isUserInteractionEnabled
                    {
                        i += 1
                    }
                    
                    if i == buttonsList.count
                    {
                        isGameOver = true
                        gameOverLabel.text = "It a Tie."
                    }
                }
            }
        }
    
        
        if isGameOver
        {
            retryButton.isEnabled = true;
            retryButton.setTitle("Retry", for: [])
            for i in 0...buttonsList.count-1
            {
                buttonsList[i].isUserInteractionEnabled = false;
            }
        }
    }
}

