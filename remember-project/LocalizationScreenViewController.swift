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
    
    @IBOutlet weak var objectNameLabel: UILabel!
    
    //Reference to the image`s data base
    var objectsImages = ListObjectsMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.LocalizationScreenCollectionView.delegate = self
        self.LocalizationScreenCollectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Get the number of objects that will be avaible to choose
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return objectsImages.getAllObjectsSize()
    }
    
    //When the button of locationScreen is pressed the name of the object will show
    @IBAction func rememberObjectButton(_ sender: UIButton) {
        
        let objectIndex = sender.tag
        let objectName = objectsImages.getObjectName(indexPath: objectIndex)
        
        self.objectNameLabel.text = String("NAME: \(objectName)")
        
        //self.LocalizationScreenCollectionView.reloadData()
    }
    
    
    //take the images from reference and add your respective cell to the collectionView
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "remember_object",  for: indexPath) as! LocalizationScreenCollectionViewCell
        
        cell.rememberScreenButton.setImage(UIImage(named: objectsImages.getObjectName(indexPath: indexPath.row)), for: UIControlState.normal)
        
        cell.layer.cornerRadius = 8
        
        return cell
    }

}









