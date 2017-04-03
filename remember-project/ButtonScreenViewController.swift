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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectsImages.getObjectsList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "button_cell",  for: indexPath) as! ButtonScreenCollectionViewCell
        
        //set images
        cell.ButtonImageView.image = UIImage(named: objectsImages.getObjectsList()[indexPath.row])
        
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
