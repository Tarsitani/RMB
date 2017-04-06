//
//  TabBarViewController.swift
//  remember-project
//
//  Created by Matheus Garcia on 06/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for:.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
