//
//  CancelPopupViewController.swift
//  remember-project
//
//  Created by Matheus Garcia on 05/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

class CancelPopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Go back to the inicial screen (LocalizationScreenViewController
    @IBAction func yesWasPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goBack", sender: self)
    }
    
    //Dimiss the screen and goes back to the ButtonScreenViewController
    @IBAction func noWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
