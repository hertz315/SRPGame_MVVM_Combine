//
//  ViewController.swift
//  SRP_Game_Combine
//
//  Created by Hertz on 10/27/22.
//

import UIKit
import Combine

class ViewController: UIViewController {

    // MARK: - @IBOulet
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var myChoiceImageView: UIImageView!
    @IBOutlet weak var myChoiceLabel: UILabel!
    @IBOutlet weak var computerChoiceImageView: UIImageView!
    @IBOutlet weak var computerChoiceLabel: UILabel!
    @IBOutlet var srpButton: [UIButton]!
    
    var gameVM: GameVM = GameVM()
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindUI()
      
    }

    // MARK: - @IBAction
    @IBAction func srpButtonTapped(_ sender: UIButton) {
        let mySrp = SRPGame.initializeTitle(sender.currentTitle!)
        gameVM.srpButtonTapped(mySrp)
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        gameVM.resetSrp()
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        gameVM.calcaulateSrp()
    }
    
    
}

extension ViewController {
    fileprivate func bindUI() {
        gameVM.userSRP
            .map{"\($0)"}
            .receive(on: DispatchQueue.main)
            .assign(to: \.text, on: myChoiceLabel)
            .store(in: &subscriptions)
        
        gameVM.userSRP
            .map{UIImage(named: "\($0)")}
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: myChoiceImageView)
            .store(in: &subscriptions)
        
        gameVM.comSRP
            .map{"\($0)"}
            .receive(on: DispatchQueue.main)
            .assign(to: \.text, on: computerChoiceLabel)
            .store(in: &subscriptions)
        
        gameVM.comSRP
            .map{ UIImage(named: "\($0)")}
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: computerChoiceImageView)
            .store(in: &subscriptions)
        
        gameVM.inputMainLabel
            .compactMap{$0}
            .receive(on: DispatchQueue.main)
            .assign(to: \.text, on: mainLabel)
            .store(in: &subscriptions)
        
    }
}

