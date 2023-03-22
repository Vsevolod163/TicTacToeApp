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
        
        resultOfGameButton.isHidden.toggle()
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
}

