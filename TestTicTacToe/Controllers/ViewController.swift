//
//  ViewController.swift
//  TestTicTacToe
//
//  Created by Fanny on 2023-09-10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtPlayer1: UITextField!
    
    
    @IBOutlet weak var txtPlayer2: UITextField!
    
    @IBOutlet weak var btnStartGame: UIButton!
    
    let SEGUE_TO_START = "segueStartGame"
    
    var myGame: Game?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myGame = Game()
    }
    
    
    
    
    
    @IBAction func startGame(_ sender: Any) {
        
        //checking so input text is not nil
        guard let playerOne = txtPlayer1.text,
              let playerTwo = txtPlayer2.text else {return}
        
        //creating a new variable of playerOne ta add the name and the start score
        let newPlayer1 = Player(name: playerOne, score: 0)
        let newPlayer2 = Player(name: playerTwo, score: 0)
        
       
            myGame?.addPlayer(newPlayer: newPlayer1)
            myGame?.addPlayer(newPlayer: newPlayer2)
        
            myGame?.printPlayers()
        
        
        
    }
    
    


}

