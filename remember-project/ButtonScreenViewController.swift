//
//  ButtonScreenViewController.swift
//  remember-project
//
//  Created by Matheus Garcia on 31/03/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

protocol SelectedItemsDelegate:NSObjectProtocol {
	func appendSelectedItems(selectedItem:Item)
}

class ButtonScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, AddItemDelegate {
	
    @IBOutlet weak var ButtonScreenCollectionView: UICollectionView!
    
    var itemsDB = ItemsDB()
	var selectedItems:[Item] = []
	
	var delegate: SelectedItemsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ButtonScreenCollectionView.delegate = self
        self.ButtonScreenCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsDB.allObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "remember_cell",  for: indexPath) as! ButtonScreenCollectionViewCell
        
        //set images in collectionView while you have them to show
		cell.itemTitle = itemsDB.allObjects[indexPath.row].iconTitle!
        cell.objectImageButton.setImage(UIImage(named: itemsDB.allObjects[indexPath.row].iconTitle!), for: UIControlState.normal)
		
        cell.delegate = self
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func addItem(title: String) {
        //get the button tag and use it as an index to find what image it refers
		//add the image to the object list on localizationScreen
		delegate?.appendSelectedItems(selectedItem: itemsDB.getItemByIconTitle(title: title)!)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller
    }
    
    @IBAction func unwindToHome(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goBack", sender: self)
    }
}
