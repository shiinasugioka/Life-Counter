//
//  ViewController.swift
//  Life Counter
//
//  Created by Shiina on 4/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    var historyLog = [String]()
    
    @IBOutlet weak var backgroundView: UIView!
    
    // Top items
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var playerCountStepper: UIStepper!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    // Players stack
    @IBOutlet weak var allPlayersStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = MyVariables.white
        
        // Background
        backgroundView.backgroundColor = MyVariables.lightBlue
        backgroundView.layer.cornerRadius = MyVariables.cornerRadius
        backgroundView.layer.masksToBounds = true
        
        allPlayersStack.axis = .vertical
        
        playerCountStepper.value = 4
        playerCountStepper.minimumValue = 2
        playerCountStepper.maximumValue = 8
        stepperLabel.text = "Number of Players: 4"
        
        initGame()
    }
    
    func initGame() {
        allPlayersStack.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        for i in 1...4 {
            let name = "Player \(i)"
            let newPlayer = Player(name, 20)
            let playerView = createPlayerView(newPlayer)
            allPlayersStack.addArrangedSubview(playerView)
            updateGameHistory("Added \(name) to game.")
        }
    }
    
    func createPlayerView(_ player: Player) -> UIStackView {
        let playerView = UIStackView() // player stack
        playerView.axis = .vertical
        playerView.alignment = .fill
        playerView.distribution = .equalSpacing
        playerView.spacing = 1
        
        // player name
        let nameLabel = UITextField()
        nameLabel.text = player.name
        playerView.addArrangedSubview(nameLabel)
        nameLabel.textColor = MyVariables.darkBlue
        
        // player score
        let scoreLabel = UILabel()
        scoreLabel.text = "\(player.lives)"
        playerView.addArrangedSubview(scoreLabel)
        scoreLabel.backgroundColor = MyVariables.darkBlue
        scoreLabel.textColor = MyVariables.white
        
        
        // updating score inputs
        let adjustScoreView = UIStackView() // score adjustments stack
        adjustScoreView.axis = .horizontal
        adjustScoreView.alignment = .fill
        
        adjustScoreView.spacing = 2
        
        let minusButton = UIButton(type: .system)
        minusButton.setTitle("-", for: .normal)
        minusButton.addTarget(self,
                              action: #selector(minusButtonTapped(_:)),
                              for: .touchUpInside)
        minusButton.backgroundColor = MyVariables.red
        minusButton.setTitleColor(MyVariables.darkBlue, for: .normal)
        adjustScoreView.addArrangedSubview(minusButton)
        
        let scoreInput = UITextField()
        scoreInput.placeholder = "\(player.lives)"
        scoreInput.keyboardType = .numberPad
        scoreInput.textColor = MyVariables.darkBlue
        scoreInput.backgroundColor = MyVariables.white
        adjustScoreView.addArrangedSubview(scoreInput)
        
        let addButton = UIButton(type: .system)
        addButton.setTitle("+", for: .normal)
        addButton.addTarget(self,
                            action: #selector(addButtonTapped(_:)),
                            for: .touchUpInside)
        addButton.backgroundColor = MyVariables.green
        addButton.setTitleColor(MyVariables.darkBlue, for: .normal)
        adjustScoreView.addArrangedSubview(addButton)
        
        
        playerView.addArrangedSubview(adjustScoreView)
        
        return playerView
    }
    
    func updateGameHistory(_ log: String) {
        print(log)
    }
    
    @objc func minusButtonTapped(_ sender: UIButton) {
        
    }
    
    @objc func addButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let newValue = Int(sender.value)
        stepperLabel.text = "Number of Players: \(newValue)"
        updateGameHistory("Changed number of players to \(newValue)")
        
        while allPlayersStack.arrangedSubviews.count > newValue {
            if let lastPlayerView = allPlayersStack.arrangedSubviews.last {
                allPlayersStack.removeArrangedSubview(lastPlayerView)
                lastPlayerView.removeFromSuperview()
            }
        }
        
        while allPlayersStack.arrangedSubviews.count < newValue {
            let newPlayer = Player("Player \(allPlayersStack.arrangedSubviews.count + 1)", 20)
            let playerView = createPlayerView(newPlayer)
            allPlayersStack.addArrangedSubview(playerView)
            updateGameHistory("Added \(newPlayer.name) to game.")
        }
    }
}

struct Player {
    var name: String
    var lives: Int
    
    init(_ name: String, _ lives: Int) {
        self.name = name
        self.lives = lives
    }
    
    mutating func updateName(_ newName: String) {
        name = newName
    }
    
    mutating func updateLives(_ update: Int) {
        lives += update
    }
}
