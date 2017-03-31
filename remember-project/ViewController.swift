//
//  ViewController.swift
//  remember-project
//
//  Created by Lucas Tarsitani on 29/03/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ButtonsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Started to set the navigation bar settings
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white] //Turn the title withe
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //Make the background cover the bar
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true //Turn translucide the bar
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil) //Hide the text in the back button
        self.navigationController?.navigationBar.tintColor = UIColor.white; //Turn all the buttons white
        //Finish to set the navigation bar settings
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwideToHome(segue: UIStoryboardSegue) {
    
    }


}

