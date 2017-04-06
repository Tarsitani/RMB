//
//  LocalizationScreenCollectionViewCell.swift
//  remember-project
//
//  Created by Lucas Tarsitani on 03/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit

protocol PressedButtonNameDelegate: NSObjectProtocol{
    func pressedButtonName(id: Int)
}

class LocalizationScreenCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: PressedButtonNameDelegate?
    
    var index:Int = 0
    
    @IBOutlet weak var rememberScreenButton: UIButton!
    @IBAction func toRemeberButton(_ sender: UIButton) {
        
        delegate?.pressedButtonName(id: index)
        
    }
    
}
