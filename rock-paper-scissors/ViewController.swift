//
//  ViewController.swift
//  rock-paper-scissors
//
//  Created by JubeHuang黃冬伊 on 2022/10/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var computerScore: UILabel!
    
    @IBOutlet weak var playAgainBtn: UIButton!
    
    @IBOutlet weak var scissorsBtn: UIButton!
    @IBOutlet weak var paperBtn: UIButton!
    @IBOutlet weak var rockBtn: UIButton!
    
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var wordingLabel: UILabel!
    
    var userScoreNumber = Score().userScore
    var computerScoreNumber = Score().computerScore
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(status: .first)
    }

    @IBAction func playAgain(_ sender: UIButton) {
        if computerScoreNumber == 10 || userScoreNumber == 10 {
            updateUI(status: .first)
        } else {
            updateUI(status: .start)
        }
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
    
    func play(userSign: Sign) {
        let computerSign = randomSign()
        computerLabel.text = computerSign.emoji
        let gameStatus = userSign.gameResult(againstSign: computerSign)
        updateUI(status: gameStatus)
        
        paperBtn.isHidden = true
        rockBtn.isHidden = true
        scissorsBtn.isHidden = true
        
        paperBtn.isEnabled = false
        rockBtn.isEnabled = false
        scissorsBtn.isEnabled = false
        
        playAgainBtn.isHidden = false
        switch userSign {
            case .rock:
                rockBtn.isHidden = false
            case .paper:
                paperBtn.isHidden = false
            case .scissors:
                scissorsBtn.isHidden = false
        }
    }
    
    func updateScore(status: GameState) {
        switch status {
            case .start:
                break
            case .first:
                computerScore.text = "0"
                userScore.text = "0"
                computerScoreNumber = 0
                userScoreNumber = 0
            case .win:
                userScoreNumber += 1
                userScore.text = "\(userScoreNumber)"
            case .lose:
                computerScoreNumber += 1
                computerScore.text = "\(computerScoreNumber)"
            case .draw:
                userScoreNumber += 1
                computerScoreNumber += 1
                computerScore.text = "\(computerScoreNumber)"
                userScore.text = "\(userScoreNumber)"
        }
        if computerScoreNumber == 10 || userScoreNumber == 10 {
            if computerScoreNumber > userScoreNumber {
                wordingLabel.text = "Computer Win!"
            } else if computerScoreNumber < userScoreNumber {
                wordingLabel.text = "U Win!"
            } else {
                wordingLabel.text = "Win Win!"
            }
            playAgainBtn.setTitle("Replay", for: .normal)
        }
    }
    
    func updateUI(status: GameState) {
        view.backgroundColor =  status.color
        wordingLabel.text = status.wording
        playAgainBtn.setTitle("One More", for: .normal)
        switch status {
            case .start:
                computerLabel.text = "👾"
                
                playAgainBtn.isHidden = true
                
                paperBtn.isHidden = false
                rockBtn.isHidden = false
                scissorsBtn.isHidden = false
                
                paperBtn.isEnabled = true
                rockBtn.isEnabled = true
                scissorsBtn.isEnabled = true
            case .first:
                computerLabel.text = "👾"
                
                playAgainBtn.isHidden = true
                
                paperBtn.isHidden = false
                rockBtn.isHidden = false
                scissorsBtn.isHidden = false
                
                paperBtn.isEnabled = true
                rockBtn.isEnabled = true
                scissorsBtn.isEnabled = true
                
                updateScore(status: .first)
            case .win:
                updateScore(status: .win)
            case .lose:
                updateScore(status: .lose)
            case .draw:
                updateScore(status: .draw)
        }
    }
    
    func randomSign() -> Sign {
        let sign = Int.random(in: 0...2)
        print(sign)
        if sign == 0 {
            return .rock
        } else if sign == 1 {
            return .paper
        } else {
            return .rock
        }
    }
}
