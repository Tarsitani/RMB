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
    static let allObjects =
		[
			Item(iconTitle: "Feeding Bottle"),
			Item(iconTitle: "Backpack"),
			Item(iconTitle: "Bank Card"),
			Item(iconTitle: "Belt"),
			Item(iconTitle: "Book"),
			Item(iconTitle: "Calculator"),
			Item(iconTitle: "Camera"),
			Item(iconTitle: "Cap"),
			Item(iconTitle: "Car Key"),
			Item(iconTitle: "Cat"),
			Item(iconTitle: "Computer"),
			Item(iconTitle: "Disc"),
			Item(iconTitle: "Dog"),
			Item(iconTitle: "Eyeglasses"),
			Item(iconTitle: "Soccer Shoe"),
			Item(iconTitle: "Hat"),
			Item(iconTitle: "Headphone"),
			Item(iconTitle: "ID Card"),
			Item(iconTitle: "iPad"),
			Item(iconTitle: "Key"),
			Item(iconTitle: "iPhone Charger"),
			Item(iconTitle: "Lighter"),
			Item(iconTitle: "Makeup"),
			Item(iconTitle: "Medicine"),
			Item(iconTitle: "Money"),
			Item(iconTitle: "Mouse"),
			Item(iconTitle: "Computer"),
			Item(iconTitle: "Notebook"),
			Item(iconTitle: "Pacifier"),
			Item(iconTitle: "Pencil Case"),
			Item(iconTitle: "Pendrive"),
			Item(iconTitle: "Portable"),
			Item(iconTitle: "Power Adapter"),
			Item(iconTitle: "Purse"),
			Item(iconTitle: "Snack"),
			Item(iconTitle: "Socks"),
			Item(iconTitle: "Suitcase"),
			Item(iconTitle: "Sunglasses"),
			Item(iconTitle: "Tie"),
			Item(iconTitle: "Toothbrush and Toothpaste"),
			Item(iconTitle: "Towel"),
			Item(iconTitle: "Umbrella"),
			Item(iconTitle: "Wallet"),
			Item(iconTitle: "Watch"),
			Item(iconTitle: "Water Bottle")
	]
	
	
    static func getItemIconTitle(indexPath: Int) -> String {
        return allObjects[indexPath].iconTitle!
    }
	
	static func getItemByIconTitle(title iconTitle: String) -> Item? {
		for item in allObjects {
			if item.iconTitle == iconTitle {
				return item
			}
		}
		return nil
	}
}
