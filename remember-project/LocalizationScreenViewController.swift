//
//  LocalizationScreenViewController.swift
//  remember-project
//
//  Created by Lucas Tarsitani on 03/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

class LocalizationScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var LocalizationScreenCollectionView: UICollectionView!
    
    var objectsImages = ListObjectsMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Started to set the navigation bar settings
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white] //Turn the title white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //Make the background cover the bar
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true //Turn translucide the bar
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil) //Hide the text in the back button
        self.navigationController?.navigationBar.tintColor = UIColor.white; //Turn all the buttons white
        //Finish to set the navigation bar settings
        
        self.LocalizationScreenCollectionView.delegate = self
        self.LocalizationScreenCollectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return objectsImages.getObjectsList().count
    }
    
    //take the images from objects and reply them on the display
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "remember_object",  for: indexPath) as!LocalizationScreenCollectionViewCell
        
        cell.choosenObjectImage.image = UIImage (named: objectsImages.getObjectsList()[indexPath.row])
        
        return cell
    }
}









