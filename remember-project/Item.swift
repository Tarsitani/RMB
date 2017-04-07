//
//  Item.swift
//  remember-project
//
//  Created by Mauricio Lorenzetti on 07/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import Foundation
import UIKit

class Item: NSObject {
	
	var iconTitle: String?
	
	init(iconTitle: String) {
		self.iconTitle = iconTitle
	}
}
