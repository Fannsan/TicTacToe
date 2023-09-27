//
//  SecondViewController.swift
//  TestTicTacToe
//
//  Created by Fanny on 2023-09-10.
//

import UIKit

class SecondViewController: UIViewController {
    


    @IBOutlet var imgCollection: [UIImageView]!
    
    @IBOutlet var tapCollection: [UITapGestureRecognizer]!
    
    @IBOutlet weak var lblPlayerTurn: UILabel!
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    
    @IBOutlet weak var lblCurrentPlayer: UILabel!
    
    @IBOutlet weak var lblScore: UILabel!
    
    var game = Game()
    
    var playerOneName : String?
    var playerTwoName : String?
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpPlayers()
        
        
        lblCurrentPlayer.text = playerOneName!
        
        
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
    
    }
    

    func makeComputerMove() {
        
        guard let currentPlayerName = game.checkName(), currentPlayerName == "Computer" else {
                     print("Not the computer's turn")
                    return}
        
   
       //Fetch the empty spots on the board
        let emptySpots = game.board.indices.filter{game.board[$0] == 0}
       
        
        //if the array is not empty
        if !emptySpots.isEmpty{

            //getting a random index from the array
            let randomIndex = Int.random(in: 0..<emptySpots.count)
            let chosenIndex = emptySpots[randomIndex]
        
            let chosenTap = tapCollection[chosenIndex]
            
            tapped(chosenTap)
            
        }else{

            return
        }
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
        }else{
            attachedImageView.image = UIImage(systemName: "circle")
            
            game.board[tag] = 2
        }
        
        print(game.board)
        
        
        //call the function checkWinner from the Game class and controlling so its not nil/false
        if game.checkWinner(){
            
            guard let playerName = game.checkName() else {return}
            
            lblPlayerTurn.text = "\(playerName) Wins!"
            
            lblCurrentPlayer.isHidden = true
            print("\(playerName) wins!")
            
            //make the play again button apper
            btnPlayAgain.isHidden = false
           
            game.incrementScore()
            
            lblScore.text = "\(game.players[0].name) score: \(game.players[0].score) \(game.players[1].name) score: \(game.players[1].score)"
            
            //So player cant continue to play after winner
            for imageView in imgCollection{
                imageView.isUserInteractionEnabled = false
                
            }
            
            return
            
        }  else {
           
            
            //check currentplayer and change it
            game.switchPlayer()
            
            guard let playerName = game.checkName() else {return}
            lblCurrentPlayer.text = playerName
        }
        
       
        
        //call the function to check if board is full
        if game.isBoardFull() {
           
            lblPlayerTurn.text = "It´s a draw, try again!"
            lblCurrentPlayer.isHidden = true
            //make the play again button apper
            btnPlayAgain.isHidden = false
            return
        }
        
        makeComputerMove()
    }
    
    
    
    
    //play again to restart the game
    @IBAction func playAgain(_ sender: Any) {
        
        btnPlayAgain.isHidden = true
        lblPlayerTurn.text = "Player turn:"
        lblCurrentPlayer.isHidden = false
        lblCurrentPlayer.text = playerOneName
        
        //call the reset function from the game class
        game.reset()
        
        
        //sett all the images in my collection to the deafult value of "circle.fill"
        for imageView in imgCollection {
            
            imageView.image = UIImage(systemName: "circle.fill")
            imageView.isUserInteractionEnabled = true
        }
    }
    
    
    
}

