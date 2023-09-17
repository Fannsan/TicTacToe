//
//  Game.swift
//  TestTicTacToe
//
//  Created by Fanny on 2023-09-10.
//

import Foundation

class Game{
    
    private var players:[Player]
    
    private var board = [0,0,0,0,0,0,0,0,0]
    
    var currentPlayer = 1
    
    init(){
        
        self.players = []
        
    }
    
    
    func switchPlayer(index: Int) {
        
        
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
    
    
    
    func printPlayers() {
        for player in players {
            print(player.name)
        }
    }
    
    
    
    
    
}
