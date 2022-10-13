//
//  ViewController.swift
//  rock-paper-scissors
//
//  Created by JubeHuang黃冬伊 on 2022/10/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scissorsBtn: UIButton!
    @IBOutlet weak var paperBtn: UIButton!
    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var wordingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startGame()
    }

    func startGame() {
        self.view.backgroundColor =  GameState.start.color
        wordingLabel.text = GameState.start.wording
    }
    func play() {
        let computerSign = Sign.allCases.randomElement()
        
    }
    
}

