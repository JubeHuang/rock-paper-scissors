//
//  ViewController.swift
//  rock-paper-scissors
//
//  Created by JubeHuang黃冬伊 on 2022/10/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playAgainBtn: UIButton!
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

    @IBAction func playAgain(_ sender: Any) {
        startGame()
    }
    @IBAction func stoneSign(_ sender: UIButton) {
        play(userSign: .rock)
    }
    @IBAction func paperSign(_ sender: UIButton) {
        play(userSign: .paper)
    }
    @IBAction func scissorSign(_ sender: UIButton) {
        play(userSign: .scissors)
    }
    func startGame() {
        self.view.backgroundColor =  GameState.start.color
        wordingLabel.text = GameState.start.wording
        playAgainBtn.isHidden = true
        paperBtn.isHidden = false
        rockBtn.isHidden = false
        scissorsBtn.isHidden = false
        computerLabel.text = "👾"
    }
    func play(userSign: Sign) {
        let computerSign = Sign.allCases.randomElement()
        computerLabel.text = computerSign?.emoji
//        let gmaeState = userSign.gameResult(againstSign: computerSign?.rawValue)
        if computerSign == userSign {
            wordingLabel.text = GameState.draw.wording
            view.backgroundColor = GameState.draw.color
            playAgainBtn.isHidden = false
        }
        switch userSign {
            case .paper:
                if computerSign == .rock {
                    wordingLabel.text = GameState.win.wording
                    view.backgroundColor = GameState.win.color
                }
            scissorsBtn.isHidden = true
            rockBtn.isHidden = true
        case .rock :
            if computerSign == .scissors {
                wordingLabel.text = GameState.win.wording
                view.backgroundColor = GameState.win.color
            }
            paperBtn.isHidden = true
            scissorsBtn.isHidden = true
        case .scissors :
            if computerSign == .paper {
                wordingLabel.text = GameState.win.wording
                view.backgroundColor = GameState.win.color
            }
            rockBtn.isHidden = true
            paperBtn.isHidden = true
        }
        wordingLabel.text = GameState.lose.wording
        view.backgroundColor = GameState.draw.color
        playAgainBtn.isHidden = false
    }
}
