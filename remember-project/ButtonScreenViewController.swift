//
//  ButtonScreenViewController.swift
//  remember-project
//
//  Created by Matheus Garcia on 31/03/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

class ButtonScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var ButtonScreenCollectionView: UICollectionView!
    
    var objectsImages = ListObjectsMenu()
    var objectToShow = ObjectListOnLocalizationScreen()
    
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
        
        self.ButtonScreenCollectionView.delegate = self
        self.ButtonScreenCollectionView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func objectImageButtons(_ sender: UIButton) {
        
        //get the button tag and use it as an index to finde what image it refers
        let imageIndex = sender.tag
        let objectName = objectsImages.getObjectName(indexPath: imageIndex)
        
        //add the image to the object list on localizationScreen
        objectToShow.addItem(objectPressed: objectName)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectsImages.getAllObjectsSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "object_to_choose",  for: indexPath) as! ButtonScreenCollectionViewCell
        
        //set images in collectionView while you have them to show
        
        cell.objectImageButton.setImage(UIImage(named: objectsImages.getObjectName(indexPath: indexPath.row)), for: UIControlState.normal)
        
        
        cell.layer.cornerRadius = 8
        
        return cell
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
