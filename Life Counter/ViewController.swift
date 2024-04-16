//
//  ViewController.swift
//  Life Counter
//
//  Created by stlp on 4/16/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = MyVariables.white
        
        backgroundView.backgroundColor = MyVariables.lightBlue
        backgroundView.layer.cornerRadius = MyVariables.cornerRadius
        backgroundView.layer.masksToBounds = true
        
        // Player 1 Items
        player1Label.text = Strings.player1Text
        player1Label.textColor = MyVariables.darkBlue
        player1Label.layer.cornerRadius = MyVariables.cornerRadius
        player1Label.layer.masksToBounds = true
        
        player1Score.textColor = MyVariables.white
        player1Score.backgroundColor = MyVariables.darkBlue
        player1Score.layer.cornerRadius = MyVariables.cornerRadius
        player1Score.text = "\(MyVariables.defaultLives)"
        
        player1Sub5.setTitle(Strings.sub5, for: .normal)
        player1Sub5.layer.cornerRadius = MyVariables.cornerRadius
        player1Sub5.tintColor = MyVariables.red
        
        player1Sub1.setTitle(Strings.sub1, for: .normal)
        player1Sub1.layer.cornerRadius = MyVariables.cornerRadius
        player1Sub1.tintColor = MyVariables.red
        
        player1Add1.setTitle(Strings.add1, for: .normal)
        player1Add1.layer.cornerRadius = MyVariables.cornerRadius
        player1Add1.tintColor = MyVariables.green
        
        player1Add5.setTitle(Strings.add5, for: .normal)
        player1Add5.layer.cornerRadius = MyVariables.cornerRadius
        player1Add5.tintColor = MyVariables.green
        
        // Player 2 Items
        player2Label.text = Strings.player2Text
        player2Label.textColor = MyVariables.darkBlue
        player2Label.layer.cornerRadius = MyVariables.cornerRadius
        player2Label.layer.masksToBounds = true
        
        player2Score.textColor = MyVariables.white
        player2Score.backgroundColor = MyVariables.darkBlue
        player2Score.layer.cornerRadius = MyVariables.cornerRadius
        player2Score.text = "\(MyVariables.defaultLives)"
        
        player2Sub5.setTitle(Strings.sub5, for: .normal)
        player2Sub5.layer.cornerRadius = MyVariables.cornerRadius
        player2Sub5.tintColor = MyVariables.red
        
        player2Sub1.setTitle(Strings.sub1, for: .normal)
        player2Sub1.layer.cornerRadius = MyVariables.cornerRadius
        player2Sub1.tintColor = MyVariables.red
        
        player2Add1.setTitle(Strings.add1, for: .normal)
        player2Add1.layer.cornerRadius = MyVariables.cornerRadius
        player2Add1.tintColor = MyVariables.green
        
        player2Add5.setTitle(Strings.add5, for: .normal)
        player2Add5.layer.cornerRadius = MyVariables.cornerRadius
        player2Add5.tintColor = MyVariables.green
        
        
        
    }
}

