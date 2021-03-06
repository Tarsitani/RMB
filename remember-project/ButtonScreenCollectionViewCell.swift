//
//  ButtonScreenCollectionViewCell.swift
//  remember-project
//
//  Created by Lucas Tarsitani on 31/03/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

protocol AddItemDelegate: NSObjectProtocol {
    func addItem (title: String)
}


class ButtonScreenCollectionViewCell: UICollectionViewCell {
    
	var itemTitle: String?
    weak var delegate: AddItemDelegate?
	
    @IBOutlet weak var objectImageButton: UIButton!
    
    @IBAction func clickImageButton(_ sender: UIButton) {
        delegate?.addItem(title:self.itemTitle!)
    }
    
}
