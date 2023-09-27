//
//  Game.swift
//  TestTicTacToe
//
//  Created by Fanny on 2023-09-10.
//

import Foundation

class Game{
    
    var players:[Player]
    
    var board = [0,0,0,0,0,0,0,0,0]
    
    var currentPlayer = 1
    
    
    init(){
        
        self.players = []
        
    }
    
    
    func switchPlayer() {
        
        if currentPlayer == 1{
            currentPlayer = 2
        }else {
            currentPlayer = 1
        }
    }
    
    
    func addPlayer(newPlayer: Player){
        
        //get the name from the view and add in to the array of players
        players.append(newPlayer)
        
    }
    
    // I want get the name of the player if it is currentplayer 1 or 2
    func checkName() -> String? {
        
        
        if currentPlayer == 1 {
            
            return players[0].name
        }else{
            
            return players[1].name
        }
        
    }
    
        // Increment the score of the players
        func incrementScore() {
        
        players[currentPlayer - 1].score += 1
        
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
        
        
        
        
        func isBoardFull() -> Bool{
            for i in board{
                
                if i == 0 {
                    
                    //there are empty spots still on the board
                    return false
                }
            }
            //All spots on the board is full
            return true
        }
        
        
        func reset(){
            
            //changing my array so it is filled with 0 and is the lenght of the board
            board = Array(repeating: 0, count: board.count)
            currentPlayer = 1
        }
        
    }
