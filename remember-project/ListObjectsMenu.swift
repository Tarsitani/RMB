//
//  ListObjectsAdded.swift
//  remember-project
//
//  Created by Lucas Tarsitani on 03/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit


//Easy to manage the list of objects that will be implemented
class ListObjectsMenu: NSObject {
    
    
    
    //Object in reference. Index: image position in objectsReference. Name: the same name of the image, to print it in the screen
    struct ObjectItem {
        var objectIndex: Int
        var objectName: String
        
        init(index: Int, name: String){
            self.objectIndex = index
            self.objectName = name
        }
    }
    
    //list of objects that will appear in buttonScreen
    var allObjects = [ObjectItem(index: 0, name: "01.jpg"), ObjectItem(index: 1, name: "02"), ObjectItem(index: 2, name: "03"), ObjectItem(index: 3, name: "04"), ObjectItem(index: 4, name: "05"), ObjectItem(index: 5, name: "06"), ObjectItem(index: 6, name: "07"), ObjectItem(index: 7, name: "08"), ObjectItem(index: 8, name: "09"), ObjectItem(index: 9, name: "10"), ObjectItem(index: 10, name: "11"), ObjectItem(index: 11, name: "12"), ObjectItem(index: 12, name: "13"), ObjectItem(index: 13, name: "14"), ObjectItem(index: 14, name: "15")]
    
    
    func getObjectName(indexPath: Int) -> String{
        return allObjects[indexPath].objectName
    }
    
    func getAllObjectsSize() -> Int{
        return allObjects.count
    }
    
    //It will add a new item in reference
    func setNewObject(index: Int, name: String){
        let newObject = ObjectItem(index: index, name: name)
        
        allObjects.append(newObject)
        
    }
}
