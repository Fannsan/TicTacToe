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
    
    @IBOutlet weak var switchToComputer: UISwitch!
    
    @IBOutlet weak var lblPlayerTwo: UILabel!
    
    let SEGUE_TO_START = "segueStartGame"
    
    //var myGame = Game()
    
   // var playerOne: String?
  //  var playerTwo: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switchToComputer.isOn = false
    }
    
    
    
    
    @IBAction func changeToComputer(_ sender: Any) {
        
        if switchToComputer.isOn{
            txtPlayer2.isHidden = true
            lblPlayerTwo.isHidden = true
            
           // txtPlayer2.text = "Computer"
            
        } else{
            txtPlayer2.isHidden = false
            lblPlayerTwo.isHidden = false
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        
        //checking so input text is not nil
        guard let playerOne = txtPlayer1.text else {return}
        
        
        var playerTwo: String?
        //checking if the switch is on and setting the name "computer" to player two
        if switchToComputer.isOn{
            playerTwo = "Computer"
            
        } else{
            // Check if txtPlayer2 is empty or contains "Computer"
                let enteredPlayerTwo = txtPlayer2.text
                if enteredPlayerTwo?.isEmpty == false && enteredPlayerTwo != "Computer" {
                    playerTwo = enteredPlayerTwo
                } else {
                    // Show an error message or handle it as needed
                    return
                }
        }
        
        if segue.identifier == SEGUE_TO_START {
            
            if let destinationVC = segue.destination as? SecondViewController{
                
                destinationVC.playerOneName = playerOne
                destinationVC.playerTwoName = playerTwo
                
                print(playerOne)
            }
            return
        }
        
        
    }
    
    


}

