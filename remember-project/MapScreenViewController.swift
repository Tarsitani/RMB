//
//  MapScreenViewController.swift
//  remember-project
//
//  Created by Matheus Garcia on 07/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

class MapScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHome(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goBack", sender: self)
    }
}
