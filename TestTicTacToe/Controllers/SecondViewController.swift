//
//  SecondViewController.swift
//  TestTicTacToe
//
//  Created by Fanny on 2023-09-10.
//

import UIKit

class SecondViewController: UIViewController {
    


    @IBOutlet var imgCollection: [UIImageView]!
    
    
    
    @IBOutlet weak var lblCurrentPlayer: UILabel!
    
    var game : Game?
    
    var currentPlayer = 1
    
    var board = [0,0,0,0,0,0,0,0,0]
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Create a function to check who is the winner
    func checkWinner() -> Bool{
     
        //check horisontal wins
        if board[0] != 0 && board[0] == board [1] && board[1] == board[2]{
            return true
        }
        
        if board[3] != 0 && board[3] == board [4] && board[4] == board[5]{
            return true
        }
        
        if board[6] != 0 && board[6] == board [7] && board[7] == board[8]{
            return true
        }
        //check vertical wins
        if board[0] != 0 && board[0] == board [3] && board[3] == board[6]{
            return true
        }
        if board[1] != 0 && board[1] == board [4] && board[4] == board[7]{
            return true
        }
        if board[2] != 0 && board[2] == board [5] && board[5] == board[8]{
            return true
        }
        //Diagonall wins
        if board[0] != 0 && board[0] == board [4] && board[4] == board[8]{
            return true
        }
        if board[2] != 0 && board[2] == board [4] && board[4] == board[6]{
            return true
        }
        
        return false
    }
    

    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
       
        //fetching the imageView
        guard let attachedImageView = sender.view as? UIImageView else {return}
       
        guard let tag = sender.view?.tag else {return}
    
        //Check if imageView is empty
        if attachedImageView.image == UIImage(systemName: "") && board[tag] == 0{
            
            if currentPlayer == 1{
                attachedImageView.image = UIImage(systemName: "xmark")
                board[tag] = 1
            
                    }else {
                        attachedImageView.image = UIImage(systemName: "circle")
                        board[tag] = 2
                        }
            
                print(board)
            
          
    
            if checkWinner(){
              
                print("player \(currentPlayer) wins!")
                
                //make an alert to show the winner and to reset the game
                

                    }  else {
                    currentPlayer = 3 - currentPlayer
                    lblCurrentPlayer.text = currentPlayer.formatted()
                    }

            } else{
            //board is full
            print("board is full or spot is taken")
           
        }

    }
    
    
    
    
}
