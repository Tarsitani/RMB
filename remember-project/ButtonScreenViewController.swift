//
//  ButtonScreenViewController.swift
//  remember-project
//
//  Created by Matheus Garcia on 31/03/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

class ButtonScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	let reuseIdentifier = "itemCell"
	
    @IBOutlet weak var itemsCollectionView: UICollectionView!
	
	var selectedItems:[Item] = []
	
	var delegate: AddGeotificationViewControllerDelegate?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
    }

	//Tell the collection view the amount of cells to create
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
		return ItemsDB.allObjects.count
	}
	
	//Creates each cell properly
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,  for: indexPath) as! ItemCollectionViewCell
		
		let itemPath = (ItemsDB.allObjects[indexPath.row].iconTitle)!
		
		let selectedColor = UIColor(red: 0.3451, green: 0.3373, blue: 0.8392, alpha: 1.0)
		let unselectedColor = UIColor.gray
		
		cell.itemImage.image = UIImage(named: itemPath)
		cell.itemName.text = itemPath
		cell.item = ItemsDB.getItemByIconTitle(title: itemPath)
		
		cell.itemImage.tintColor = unselectedColor
		for item in selectedItems {
			if (item.iconTitle == itemPath) {
				cell.itemImage.tintColor = selectedColor
				break
			}
		}
		
		cell.layer.cornerRadius = 8
		
		return cell
	}
	
	//Registers or removes an item
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath) as! ItemCollectionViewCell
		let itemName = cell.itemName.text
		let selectedColor = UIColor(red: 0.3451, green: 0.3373, blue: 0.8392, alpha: 1.0)
		let unselectedColor = UIColor.gray
		
		for item in selectedItems {
			if (item.iconTitle == itemName) {
				selectedItems.remove(at: selectedItems.index(of: item)!)
				cell.itemImage.tintColor = unselectedColor
				delegate?.manageSelectedItems(item: Item(iconTitle: itemName!))
				return
			}
		}
		selectedItems.append(Item(iconTitle: itemName!))
		cell.itemImage.tintColor = selectedColor
		
		delegate?.manageSelectedItems(item: Item(iconTitle: itemName!))
	}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "toMap") {
			let vc = segue.destination as! AddGeotificationViewController
			vc.items = selectedItems
			vc.delegate = delegate as AddGeotificationViewControllerDelegate!
		}
    }
    
    @IBAction func unwindToHome(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goBack", sender: self)
    }
}
