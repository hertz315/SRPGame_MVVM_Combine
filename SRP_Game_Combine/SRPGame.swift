//
//  SRPGame.swift
//  SRP_Game_Combine
//
//  Created by Hertz on 10/27/22.
//

import UIKit

enum SRPGame {
    case scissors
    case rock
    case paper
    case ready
    
    /// 버튼의 타이틀을 인풋값으로 받아 이넘타입으로 반환해주는 함수
    static func initializeTitle(_ btnTitle: String) -> Self {
        switch btnTitle {
        case "가위":
            return .scissors
        case "바위":
            return .rock
        case "보":
            return .paper
        default:
            return .ready
        }
    }
    
    /// 타입 타이틀 라벨 생성
    var labelTitle: String {
        switch self {
        case .scissors:
            return "✂️가위✂️"
        case .rock:
            return "🪨바위🪨"
        case .paper:
            return "✋🏻보✋🏻"
        case .ready:
            return "🚀준비🚀"
        }
    }
    
    /// 타입 이미지 생성
    var setupImage: UIImage {
        switch self {
        case .scissors:
            return UIImage(named: "scissors")!
        case .rock:
            return UIImage(named: "rock")!
        case .paper:
            return UIImage(named: "paper")!
        case .ready:
            return UIImage(named: "ready")!
        }
    }
    
    
}
