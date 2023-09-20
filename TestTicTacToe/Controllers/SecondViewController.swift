//
//  SecondViewController.swift
//  TestTicTacToe
//
//  Created by Fanny on 2023-09-10.
//

import UIKit

class SecondViewController: UIViewController {
    


    @IBOutlet var imgCollection: [UIImageView]!
    
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    
    @IBOutlet weak var lblCurrentPlayer: UILabel!
    
    var game = Game()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        //game = Game()
    }
    

    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
       
        //fetching the imageView
        guard let attachedImageView = sender.view as? UIImageView else {return}
       
        guard let tag = sender.view?.tag else {return}
    
        
        
   
        
        
        //Check if imageView is empty
        guard attachedImageView.image == UIImage(systemName: "circle.fill") && game.board[tag] == 0 else {
        
            print ("spot is taken")
            return
        }
        
      
        
            
            //check if currentplayer is 1 in that case change picture to an x
            if game.currentPlayer == 1{
                attachedImageView.image = UIImage(systemName: "xmark")
               //set the tagged index in my board to 1 when player 1 has placed a x
                game.board[tag] = 1
            
                //if currentplayer is not 1 change picture to circle
                    }else {
                        attachedImageView.image = UIImage(systemName: "circle")
                        game.board[tag] = 2
                        game.currentPlayer = 2
                        }
            
            print(game.board)
            
            
       //call the function checkWinner from the Game class and controlling so its not nil/false
            if game.checkWinner(){
              
                   
                print("player \(String(describing: game.currentPlayer)) wins!")
                
                //make the play again buttun apper
                btnPlayAgain.isHidden = false
                
                //make an alert to show the winner and to reset the game

                    }  else {
                     //check currentplayer and change it
                        game.switchPlayer(index: 0)
                        
                        lblCurrentPlayer.text = "Player \(game.currentPlayer)"
                    }
        
        
        //trying to call the function to check if board is full
        if game.isBoardFull() {
            print("Board is full")
          
            
            //btnPlayAgain.isHidden = true
           game.reset()
            for imageView in imgCollection {
                
                imageView.image = UIImage(systemName: "circle.fill")
            }
            
            return
        }
        
        }
    
    
    
    //play again to restart the game
    @IBAction func playAgain(_ sender: Any) {
        
        
        btnPlayAgain.isHidden = true
        
        //call the reset function from the game class
        game.reset()
        
        //sett all the images in my collection to the deafult value of "circle.fill"
        for imageView in imgCollection {
            
            imageView.image = UIImage(systemName: "circle.fill")
        }
        
    }
    
    
    
}

//ändra så att index blir ändrat direkt när man trycker på knappen 
