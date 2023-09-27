//
//  Player.swift
//  TestTicTacToe
//
//  Created by Fanny on 2023-09-10.
//

import Foundation

struct Player{
    
    var name: String
    
    var score: Int
    

    init(name: String, score: Int?) {
        self.name = name
        self.score = score ?? 0
    }
}


