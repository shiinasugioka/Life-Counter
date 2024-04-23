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
    
    @IBOutlet weak var topItemStack: UIStackView!
    @IBOutlet weak var playerCountStack: UIStackView!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var allPlayersStack: UIStackView! // Players stack
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = MyVariables.white
        
        // Background
        backgroundView.backgroundColor = MyVariables.lightBlue
        backgroundView.layer.cornerRadius = MyVariables.cornerRadius
        backgroundView.layer.masksToBounds = true
        
        allPlayersStack.axis = .vertical
        
        NSLayoutConstraint.activate([
            playerCountStack.heightAnchor.constraint(equalTo: topItemStack.heightAnchor, multiplier: 0.05),
            buttonStack.heightAnchor.constraint(equalTo: topItemStack.heightAnchor, multiplier: 0.05)
        ])
        
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
            let newPlayer = Player(name, MyVariables.defaultLives)
            let playerView = createPlayerView(newPlayer)
            allPlayersStack.addArrangedSubview(playerView)
            updateGameHistory("Added \(name) to game.")
        }
    }
    
    func createPlayerView(_ player: Player) -> UIStackView {
        let playerView = UIStackView() // player stack
        playerView.axis = .vertical
        playerView.alignment = .fill
        playerView.distribution = .fillEqually
        playerView.spacing = 5
        
        // player name and score
        let nameAndScoreView = UIStackView()
        nameAndScoreView.axis = .horizontal
        nameAndScoreView.alignment = .fill
        nameAndScoreView.distribution = .fillProportionally
        
        let nameLabel = UITextField()
        nameLabel.text = player.name
        nameLabel.textColor = MyVariables.darkBlue
        nameLabel.font = MyVariables.mainFont
        nameAndScoreView.addArrangedSubview(nameLabel)
        
        let scoreLabel = UILabel()
        scoreLabel.text = "\(player.lives)"
        scoreLabel.backgroundColor = MyVariables.darkBlue
        scoreLabel.textColor = MyVariables.white
        scoreLabel.font = MyVariables.subFont
        scoreLabel.layer.cornerRadius = MyVariables.cornerRadius
        scoreLabel.textAlignment = .center
        scoreLabel.layer.masksToBounds = true
        nameAndScoreView.addArrangedSubview(scoreLabel)
        
        playerView.addArrangedSubview(nameAndScoreView)
        
        
        // updating score inputs
        let adjustScoreView = UIStackView() // score adjustments stack
        adjustScoreView.axis = .horizontal
        adjustScoreView.alignment = .fill
        adjustScoreView.spacing = 0
        
        let minusButton = UIButton(type: .system)
        minusButton.setTitle("Minus", for: .normal)
        minusButton.addTarget(self,
                              action: #selector(minusButtonTapped(_:)),
                              for: .touchUpInside)
        minusButton.backgroundColor = MyVariables.red
        minusButton.setTitleColor(MyVariables.darkBlue, for: .normal)
        minusButton.layer.cornerRadius = MyVariables.cornerRadius
        minusButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        adjustScoreView.addArrangedSubview(minusButton)
        
        let scoreInput = UITextField()
        scoreInput.placeholder = "\(player.lives)"
        scoreInput.keyboardType = .numberPad
        scoreInput.textColor = MyVariables.darkBlue
        scoreInput.backgroundColor = MyVariables.white
        scoreInput.translatesAutoresizingMaskIntoConstraints = false
        scoreInput.textAlignment = .center
        adjustScoreView.addArrangedSubview(scoreInput)
        
        let addButton = UIButton(type: .system)
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self,
                            action: #selector(addButtonTapped(_:)),
                            for: .touchUpInside)
        addButton.backgroundColor = MyVariables.green
        addButton.setTitleColor(MyVariables.darkBlue, for: .normal)
        addButton.layer.cornerRadius = MyVariables.cornerRadius
        addButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        addButton.translatesAutoresizingMaskIntoConstraints = false
        adjustScoreView.addArrangedSubview(addButton)
        
        playerView.addArrangedSubview(adjustScoreView)
        
        NSLayoutConstraint.activate([
            minusButton.widthAnchor.constraint(equalTo: adjustScoreView.widthAnchor, multiplier: 0.2),
            scoreInput.widthAnchor.constraint(equalTo: adjustScoreView.widthAnchor, multiplier: 0.6),
            addButton.widthAnchor.constraint(equalTo: minusButton.widthAnchor, multiplier: 1)
        ])
        
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
