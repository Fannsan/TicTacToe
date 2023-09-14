//
//  SecondViewController.swift
//  TestTicTacToe
//
//  Created by Fanny on 2023-09-10.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imgA1: UIImageView!
    
    
    @IBOutlet weak var imgA2: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         //imgA1.isHidden = true
    }
    
    

    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        print("tapped")
        
        
        guard let attachedImageView = sender.view as? UIImageView else {return}
        
        
        
        attachedImageView.image = UIImage(systemName: "xmark")
        
    
        
    }
    
}
