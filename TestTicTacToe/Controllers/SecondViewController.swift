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
        
         imgA1.isHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func tappedA1(_ sender: UITapGestureRecognizer) {
        
        print("tapped")
        
        imgA1.isHidden = false
    }
    

}
