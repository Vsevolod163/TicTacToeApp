//
//  ViewController.swift
//  TicTacToe
//
//  Created by Vsevolod Lashin on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ticTacToeLabel: UILabel!
    @IBOutlet var resultOfGameButton: UILabel!
    
    @IBOutlet var newGameButton: UIButton!
    @IBOutlet var firstSquareButton: UIButton!
    @IBOutlet var secondSquareButton: UIButton!
    @IBOutlet var thirdSquareButton: UIButton!
    @IBOutlet var fourthSquareButton: UIButton!
    @IBOutlet var fifthSquareButton: UIButton!
    @IBOutlet var sixthSquareButton: UIButton!
    @IBOutlet var seventhSquareButton: UIButton!
    @IBOutlet var eighthSquareButton: UIButton!
    @IBOutlet var ninthSquareButton: UIButton!
    
    private var countOfMoves = 0
    private var isGameEnds = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius(
            buttons:
                newGameButton,
                firstSquareButton,
                secondSquareButton,
                thirdSquareButton,
                fourthSquareButton,
                fifthSquareButton,
                sixthSquareButton,
                seventhSquareButton,
                eighthSquareButton,
                ninthSquareButton
        )
        
        setTextForSquareButtons(
            buttons:
                firstSquareButton,
                secondSquareButton,
                thirdSquareButton,
                fourthSquareButton,
                fifthSquareButton,
                sixthSquareButton,
                seventhSquareButton,
                eighthSquareButton,
                ninthSquareButton
        )
        
        resultOfGameButton.text = ""
        resultOfGameButton.isHidden.toggle()
    }
    
    @IBAction func tapSquareButton(_ sender: UIButton) {
        guard checkTextInSquare(button: sender) else { return }
        guard !isGameEnds else { return }
        
        countOfMoves += 1
        
        if !countOfMoves.isMultiple(of: 2) {
            sender.setTitle("X", for: .normal)
        } else {
            sender.setTitle("O", for: .normal)
        }
        
        checkResultOfGame()
    }
    
    @IBAction func tapNewGameButton(_ sender: UIButton) {
        setTextForSquareButtons(
            buttons:
                firstSquareButton,
                secondSquareButton,
                thirdSquareButton,
                fourthSquareButton,
                fifthSquareButton,
                sixthSquareButton,
                seventhSquareButton,
                eighthSquareButton,
                ninthSquareButton
        )
        
        countOfMoves = 0
        resultOfGameButton.text = ""
        resultOfGameButton.isHidden = true
        isGameEnds = false
    }
    
    
    private func setCornerRadius(buttons: UIButton...) {
        for button in buttons {
            button.layer.cornerRadius = 10
        }
    }
    
    private func setTextForSquareButtons(buttons: UIButton...) {
        for button in buttons {
            button.setTitle("", for: .normal)
        }
    }
    
    private func checkTextInSquare(button: UIButton) -> Bool {
        button.currentTitle == "" ? true : false
    }
    
    private func checkResultOfGame() {
        guard countOfMoves < 10 else { return }
        
        var sign = "X"
        
        if countOfMoves.isMultiple(of: 2) {
            sign = "O"
        }
        
        let firstLine: Set = [
            firstSquareButton.currentTitle,
            secondSquareButton.currentTitle,
            thirdSquareButton.currentTitle
        ]
        let secondLine: Set = [
            fourthSquareButton.currentTitle,
            fifthSquareButton.currentTitle,
            sixthSquareButton.currentTitle
        ]
        let thirdLine: Set = [
            seventhSquareButton.currentTitle,
            eighthSquareButton.currentTitle,
            ninthSquareButton.currentTitle
        ]
        
        let firstColumn: Set = [
            firstSquareButton.currentTitle,
            fourthSquareButton.currentTitle,
            seventhSquareButton.currentTitle
        ]
        let secondColumn: Set = [
            secondSquareButton.currentTitle,
            fifthSquareButton.currentTitle,
            eighthSquareButton.currentTitle
        ]
        let thirdColumn: Set = [
            thirdSquareButton.currentTitle,
            sixthSquareButton.currentTitle,
            ninthSquareButton.currentTitle
        ]
        
        let firstDiagonal: Set = [
            seventhSquareButton.currentTitle,
            fifthSquareButton.currentTitle,
            thirdSquareButton.currentTitle
        ]
        
        let secondDiagonal: Set = [
            firstSquareButton.currentTitle,
            fifthSquareButton.currentTitle,
            ninthSquareButton.currentTitle
        ]

        if firstLine.count == 1 && !firstLine.contains("") {
            resultOfGameButton.text = "Победили \(sign)!"
        } else if secondLine.count == 1 && !secondLine.contains("") {
            resultOfGameButton.text = "Победили \(sign)!"
        } else if thirdLine.count == 1 && !thirdLine.contains("") {
            resultOfGameButton.text = "Побелили \(sign)!"
        } else if firstColumn.count == 1 && !firstColumn.contains("") {
            resultOfGameButton.text = "Побелили \(sign)!"
        } else if secondColumn.count == 1 && !secondColumn.contains("") {
            resultOfGameButton.text = "Побелили \(sign)!"
        } else if thirdColumn.count == 1 && !thirdColumn.contains("") {
            resultOfGameButton.text = "Побелили \(sign)!"
        } else if firstDiagonal.count == 1 && !firstDiagonal.contains("") {
            resultOfGameButton.text = "Побелили \(sign)!"
        } else if secondDiagonal.count == 1 && !secondDiagonal.contains("") {
            resultOfGameButton.text = "Побелили \(sign)!"
        }
            
        if countOfMoves == 9 {
            resultOfGameButton.text = "Ничья!"
        }
        
        if resultOfGameButton.text != "" {
            resultOfGameButton.isHidden.toggle()
            isGameEnds = true
        }
    }
}

