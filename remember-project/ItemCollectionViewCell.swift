//
//  ItemCollectionViewCell.swift
//  remember-project
//
//  Created by Mauricio Lorenzetti on 12/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var itemName: UILabel!
	@IBOutlet weak var itemImage: UIImageView!
	
	var item:Item? = nil
	
}
