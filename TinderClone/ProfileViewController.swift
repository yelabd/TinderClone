//
//  ProfileViewController.swift
//  TinderClone
//
//  Created by Youssef Elabd on 4/7/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var posterView: UIImageView!
    
    var image : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterView.image = image

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
