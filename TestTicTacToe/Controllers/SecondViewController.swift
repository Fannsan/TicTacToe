//
//  SecondViewController.swift
//  TestTicTacToe
//
//  Created by Fanny on 2023-09-10.
//

import UIKit

class SecondViewController: UIViewController {
    


    @IBOutlet var imgCollection: [UIImageView]!
    
    @IBOutlet weak var lblPlayerTurn: UILabel!
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    
    @IBOutlet weak var lblCurrentPlayer: UILabel!
    
    var game = Game()
    
    var playerOneName : String?
    var playerTwoName : String?
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpPlayers()
        
        
        lblCurrentPlayer.text = "Player \(playerOneName!)"
        
     
        
        
    }
    
    func setUpPlayers(){
        
        guard let playerOneName = playerOneName, let playerTwoName = playerTwoName else{
            print("No players found")
            return
        }
        
        //creating a new variable of playerOne ta add the name and the start score
        let newPlayer1 = Player(name: playerOneName, score: 0)
        let newPlayer2 = Player(name: playerTwoName, score: 0)
        
        game.addPlayer(newPlayer: newPlayer1)
        game.addPlayer(newPlayer: newPlayer2)
    
        game.printPlayers()
    }
    

    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        
        
        //fetching the imageView
        guard let attachedImageView = sender.view as? UIImageView else {return}
        
        guard let tag = sender.view?.tag else {return}
        
        //Check if imageView is empty
        guard attachedImageView.image == UIImage(systemName: "circle.fill") && game.board[tag] == 0 else {
            
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
            
            lblPlayerTurn.text = "Player \(game.checkName()!) Wins!"
            
            lblCurrentPlayer.isHidden = true
            print("player \(game.checkName()!) wins!")
            
            //make the play again button apper
            btnPlayAgain.isHidden = false
           
            for imageView in imgCollection{
                imageView.isUserInteractionEnabled = false

            }
            
            return
            
        }  else {
           
            //check currentplayer and change it
            game.switchPlayer()
            lblCurrentPlayer.text = "Player \(game.checkName()!)"
            
           
            
        }
        
        
        
        //call the function to check if board is full
        if game.isBoardFull() {
           
            lblPlayerTurn.text = "The board is full, try again!"
            lblCurrentPlayer.isHidden = true
            //make the play again button apper
            btnPlayAgain.isHidden = false
            return
        }
        
    }
    
    
    
    
    //play again to restart the game
    @IBAction func playAgain(_ sender: Any) {
        
        btnPlayAgain.isHidden = true
        lblPlayerTurn.text = "Player turn:"
        lblCurrentPlayer.isHidden = false
        
        
        //call the reset function from the game class
        game.reset()
        
        lblCurrentPlayer.text = "Player \(game.currentPlayer)"
        
        //sett all the images in my collection to the deafult value of "circle.fill"
        for imageView in imgCollection {
            
            imageView.image = UIImage(systemName: "circle.fill")
            imageView.isUserInteractionEnabled = true
        }
    }
    
    
    
}

