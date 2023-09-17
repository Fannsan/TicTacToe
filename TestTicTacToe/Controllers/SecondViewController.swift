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
    
    var board = [UIImage]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         //imgA1.isHidden = true
       
    }
    
    

    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
       
        guard let attachedImageView = sender.view as? UIImageView else {return}
       
    
    
        //Check if imageView is empty
        if attachedImageView.image == UIImage(systemName: ""){
            
            if currentPlayer == 1{
                attachedImageView.image = UIImage(systemName: "xmark")
                currentPlayer = 2
                
            }else {
                currentPlayer = 1
                attachedImageView.image = UIImage(systemName: "circle")
                
            }
            
            lblCurrentPlayer.text = currentPlayer.formatted()
    
//            if checBoard(){
//                print("filled board")
//            }
        }

    }
    
    
    func checBoard() -> Bool{
     var filledCount = 0
        
        for imageView in ImgCollection.subviews{
            if let image = imageView as? UIImageView, image.image != UIImage(systemName: ""){
                filledCount += 1
            }
                
        }
        if filledCount == 9 {
            
           
            return true
            
        }
        
        return false
    }
    
    
    
}
