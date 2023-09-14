//
//  SecondViewController.swift
//  TestTicTacToe
//
//  Created by Fanny on 2023-09-10.
//

import UIKit

class SecondViewController: UIViewController {
    

    @IBOutlet weak var ImgCollection: UIImageView!
    
    
    @IBOutlet weak var lblCurrentPlayer: UILabel!
    
    var game : Game?
    
    var currentPlayer = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         //imgA1.isHidden = true
    }
    
    

    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
       
        guard let attachedImageView = sender.view as? UIImageView else {return}
    
        
        if currentPlayer == 1{
            attachedImageView.image = UIImage(systemName: "xmark")
            currentPlayer = 2
            
            lblCurrentPlayer.text = currentPlayer.formatted()
            
        }else {
            currentPlayer = 1
            attachedImageView.image = UIImage(systemName: "circle")
            lblCurrentPlayer.text = currentPlayer.formatted()
        }
        
    
        
        
        
        
        
      
        
    
        
    }
    
}
