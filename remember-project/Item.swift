//
//  Item.swift
//  remember-project
//
//  Created by Mauricio Lorenzetti on 07/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import Foundation
import UIKit

struct ItemKey {
	static let iconTitleKey = "iconTitle"
}

class Item: NSObject, NSCoding {
	
	var iconTitle: String?
	
	init(iconTitle: String) {
		self.iconTitle = iconTitle
	}
	
	public func encode(with aCoder: NSCoder) {
		
		aCoder.encode(iconTitle, forKey: ItemKey.iconTitleKey)
		
	}
	
	public convenience required init?(coder aDecoder: NSCoder) {
		
		let x = aDecoder.decodeObject(forKey: ItemKey.iconTitleKey) as! String
		
		self.init(iconTitle: x)
		
	}
	
}
