//
//  enum.swift
//  rock-paper-scissors
//
//  Created by JubeHuang黃冬伊 on 2022/10/13.
//

import Foundation
import UIKit

enum Sign:String , CaseIterable {
    case paper =  "✌️"
    case rock = "✊"
    case scissors = "🖐"
    
    func gameResult(againstSign: Sign) -> GameState {
        if self == againstSign {
            return GameState.draw
        }
        switch self {
            case .scissors:
                if againstSign == .paper {
                    return .win
                }
            case .rock:
                if againstSign == .scissors {
                    return .win
                }
            case .paper:
                if againstSign == .rock {
                    return .win
                }
        }
        return .lose
    }
}

enum GameState {
    case win
    case lose
    case draw
    case start
    
    var wording:String {
        switch self {
            case .win:
                return "You Win!"
            case .lose:
                return "You Lost!"
            case .draw:
                return "It's a Draw!"
            case .start:
                return "Rock, Paper, Scissors?"
        }
    }
    var color:UIColor {
        switch self {
            case .win:
                return UIColor(red: 254/255, green: 229/255, blue: 159/255, alpha: 1)
            case .lose:
                return UIColor(red: 223/255, green: 134/255, blue: 99/255, alpha: 1)
            case .draw:
                return UIColor(red: 121/255, green: 185/255, blue: 166/255, alpha: 1)
            case .start:
                return UIColor(red: 56/255, green: 86/255, blue: 122/255, alpha: 1)
        }
    }
}
