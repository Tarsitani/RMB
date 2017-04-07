//
//  ListObjectsAdded.swift
//  remember-project/Users/mauricio/Documents/Projects/RMB/remember-project/ListObjectsMenu.swift
//
//  Created by Lucas Tarsitani on 03/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit


//Easy to manage the list of objects that will be implemented
class ItemsDB: NSObject {
    
    //list of objects that will appear in buttonScreen
    var allObjects = [Item(iconTitle: "01.jpg"), Item(iconTitle: "02"), Item (iconTitle: "03"), Item(iconTitle: "04"), Item(iconTitle: "05"), Item(iconTitle: "06"), Item(iconTitle: "07"), Item(iconTitle: "08"), Item(iconTitle: "09"), Item(iconTitle: "10"), Item(iconTitle: "11"), Item(iconTitle: "12"), Item(iconTitle: "13"), Item(iconTitle: "14"), Item(iconTitle: "15")]
	
	
    func getObjectIconTitle(indexPath: Int) -> String {
        return allObjects[indexPath].iconTitle!
    }
	
	func getItemByIconTitle(title iconTitle: String) -> Item? {
		for item in allObjects {
			if item.iconTitle == iconTitle {
				return item
			}
		}
		return nil
	}
}
