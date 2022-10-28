//
//  GameVM.swift
//  SRP_Game_Combine
//
//  Created by Hertz on 10/27/22.
//

import Foundation
import Combine
import UIKit

class GameVM: ObservableObject {
    
    /// 컴퓨터 가위 바위 보 상태
    var comSRP: CurrentValueSubject<SRPGame, Never> = CurrentValueSubject<SRPGame, Never>(.ready)
    
    /// 나의 가위 바위 보 선택
    var userSRP: CurrentValueSubject<SRPGame, Never> = CurrentValueSubject<SRPGame, Never>(.ready)
    
    /// 메인라벨 상태
    var inputMainLabel = PassthroughSubject<String, Never>()
    
    
    var subscriptions = Set<AnyCancellable>()
    
    /// 컴퓨터와 나의 가위바위보 비교
    func srpButtonTapped(_ mySrp: SRPGame) {
        self.userSRP.send(mySrp)
    }
    
    func calcaulateSrp() {
        let srps = ["가위", "바위", "보"]
        let srp = srps.randomElement()!
        let comSrp = SRPGame.initializeTitle(srp)
        self.comSRP.value = comSrp
        
        /// 가위 바위 보 *계산*
        /// 메인라벨에 누가 이겼는지 표시
        let myChoice = self.userSRP.value
        let comChoice = self.comSRP.value
        
        switch myChoice {
        case .scissors:
            if comChoice == .rock {
                self.inputMainLabel.send("졌습니다")
            } else if comChoice == .scissors {
                self.inputMainLabel.send("비겼습니다")
            } else {
                self.inputMainLabel.send("이겼습니다")
            }
        case .rock:
            if comChoice == .rock {
                self.inputMainLabel.send("비겼습니다")
            } else if comChoice == .scissors {
                self.inputMainLabel.send("이겼습니다")
            } else {
                self.inputMainLabel.send("졌습니다")
            }

        case .paper:
            if comChoice == .rock {
                self.inputMainLabel.send("이겼습니다")
            } else if comChoice == .scissors {
                self.inputMainLabel.send("졌습니다")
            } else {
                self.inputMainLabel.send("비겼습니다")
            }
        case .ready:
            break
        }
    }
    
    func resetSrp() {
        /// 나의 가위바위보 준비상태
        self.userSRP.value = .ready
        /// 컴퓨터 가위바위보 준비상태
        self.comSRP.value = .ready
        self.inputMainLabel.send("선택하세요")
    }
    
}


