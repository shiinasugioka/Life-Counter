//
//  ViewController.swift
//  Life Counter
//
//  Created by Shiina on 4/16/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var playerLostLabel: UILabel!
    
    // Player 1 Items
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player1Sub5: UIButton!
    @IBOutlet weak var player1Sub1: UIButton!
    @IBOutlet weak var player1Add1: UIButton!
    @IBOutlet weak var player1Add5: UIButton!
    
    // Player 2 Items
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    @IBOutlet weak var player2Sub5: UIButton!
    @IBOutlet weak var player2Sub1: UIButton!
    @IBOutlet weak var player2Add1: UIButton!
    @IBOutlet weak var player2Add5: UIButton!
    
    var player1Points: Int = MyVariables.defaultLives
    var player2Points: Int = MyVariables.defaultLives
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = MyVariables.white
        playerLostLabel.isHidden = true
        
        // Background
        backgroundView.backgroundColor = MyVariables.lightBlue
        backgroundView.layer.cornerRadius = MyVariables.cornerRadius
        backgroundView.layer.masksToBounds = true
        
        // Player Lost Label
        playerLostLabel.textColor = MyVariables.darkBlue
        
        // Player 1 Items
        player1Label.text = Strings.player1Text
        player1Label.textColor = MyVariables.darkBlue
        
        player1Score.textColor = MyVariables.white
        player1Score.preferredMaxLayoutWidth = 336
        player1Score.backgroundColor = MyVariables.darkBlue
        player1Score.layer.cornerRadius = MyVariables.cornerRadius
        player1Score.layer.masksToBounds = true
        player1Score.text = "\(player1Points)"
        
        player1Sub5.setTitle(Strings.sub5, for: .normal)
        player1Sub5.layer.cornerRadius = MyVariables.cornerRadius
        player1Sub5.layer.masksToBounds = true
        player1Sub5.tintColor = MyVariables.red
        
        player1Sub1.setTitle(Strings.sub1, for: .normal)
        player1Sub1.layer.cornerRadius = MyVariables.cornerRadius
        player1Sub1.layer.masksToBounds = true
        player1Sub1.tintColor = MyVariables.red
        
        player1Add1.setTitle(Strings.add1, for: .normal)
        player1Add1.layer.cornerRadius = MyVariables.cornerRadius
        player1Add1.layer.masksToBounds = true
        player1Add1.tintColor = MyVariables.green
        
        player1Add5.setTitle(Strings.add5, for: .normal)
        player1Add5.layer.cornerRadius = MyVariables.cornerRadius
        player1Add5.layer.masksToBounds = true
        player1Add5.tintColor = MyVariables.green
        
        // Connect buttons to action methods
        player1Sub5.addTarget(
            self,
            action: #selector(updateScore),
            for: .touchUpInside
        )
        player1Sub1.addTarget(
            self,
            action: #selector(updateScore),
            for: .touchUpInside
        )
        player1Add1.addTarget(
            self,
            action: #selector(updateScore),
            for: .touchUpInside
        )
        player1Add5.addTarget(
            self,
            action: #selector(updateScore),
            for: .touchUpInside
        )
        
        
        // Player 2 Items
        player2Label.text = Strings.player2Text
        player2Label.textColor = MyVariables.darkBlue
        
        player2Score.textColor = MyVariables.white
        player2Score.preferredMaxLayoutWidth = 336
        player2Score.backgroundColor = MyVariables.darkBlue
        player2Score.layer.cornerRadius = MyVariables.cornerRadius
        player2Score.layer.masksToBounds = true
        player2Score.text = "\(player2Points)"
        
        player2Sub5.setTitle(Strings.sub5, for: .normal)
        player2Sub5.layer.cornerRadius = MyVariables.cornerRadius
        player2Sub5.layer.masksToBounds = true
        player2Sub5.tintColor = MyVariables.red
        
        player2Sub1.setTitle(Strings.sub1, for: .normal)
        player2Sub1.layer.cornerRadius = MyVariables.cornerRadius
        player2Sub1.layer.masksToBounds = true
        player2Sub1.tintColor = MyVariables.red
        
        player2Add1.setTitle(Strings.add1, for: .normal)
        player2Add1.layer.cornerRadius = MyVariables.cornerRadius
        player2Add1.layer.masksToBounds = true
        player2Add1.tintColor = MyVariables.green
        
        player2Add5.setTitle(Strings.add5, for: .normal)
        player2Add5.layer.cornerRadius = MyVariables.cornerRadius
        player2Add5.layer.masksToBounds = true
        player2Add5.tintColor = MyVariables.green
        
        // Connect buttons to action methods
        player2Sub5.addTarget(
            self,
            action: #selector(updateScore),
            for: .touchUpInside
        )
        player2Sub1.addTarget(
            self,
            action: #selector(updateScore),
            for: .touchUpInside
        )
        player2Add1.addTarget(
            self,
            action: #selector(updateScore),
            for: .touchUpInside
        )
        player2Add5.addTarget(
            self,
            action: #selector(updateScore),
            for: .touchUpInside
        )
        
        
    }
    
    @objc func updateScore(sender: UIButton) {
        var updateBy: Int = 0
        var playerNum: Int = 0
        
        switch sender {
        case player1Sub5:
            updateBy = -5
            playerNum = 1
        case player1Sub1:
            updateBy = -1
            playerNum = 1
        case player1Add1:
            updateBy = 1
            playerNum = 1
        case player1Add5:
            updateBy = 5
            playerNum = 1
        case player2Sub5:
            updateBy = -5
            playerNum = 2
        case player2Sub1:
            updateBy = -1
            playerNum = 2
        case player2Add1:
            updateBy = 1
            playerNum = 2
        case player2Add5:
            updateBy = 5
            playerNum = 2
        default:
            break
        }
        
        if (playerNum == 1) {
            player1Points += updateBy
            if (player1Points >= 999) { player1Points = 999 }
            player1Score.text = "\(player1Points)"
        } else if (playerNum == 2) {
            player2Points += updateBy
            if (player2Points >= 999) { player2Points = 999 }
            player2Score.text = "\(player2Points)"
        }
        
        if (player1Points <= 0) {
            playerLostLabel.text = Strings.player1LostText
            playerLostLabel.isHidden = false
        } else if (player2Points <= 0) {
            playerLostLabel.text = Strings.player2LostText
            playerLostLabel.isHidden = false
        }
        
    }
}

