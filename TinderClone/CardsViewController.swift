//
//  CardsViewController.swift
//  TinderClone
//
//  Created by Youssef Elabd on 4/6/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!
    
    @IBOutlet weak var ryanView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanImage(sender:)))
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(panGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var userImageView: UIImageView!
    
    @IBAction func didPanImage(sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        let heightHalf = ryanView.bounds.height/2
        
        if sender.state == .began {
            cardInitialCenter = ryanView.center
            

            print("Gesture began")
        } else if sender.state == .changed {
            print("Gesture is changing")
            ryanView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            ryanView.transform = view.transform.rotated(by: CGFloat(Double(translation.x) * M_PI / 550))
            
            if(translation.x > 50){
                ryanView.removeFromSuperview()
            }else if(translation.x < -50){
                ryanView.removeFromSuperview()
            }
            
            print(ryanView.bounds.height)
            
        } else if sender.state == .ended {
            ryanView.transform = CGAffineTransform.identity
            ryanView.center = cardInitialCenter
            print("Gesture ended")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ProfileViewController
        
        destination.image = ryanView.image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
