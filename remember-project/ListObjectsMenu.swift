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
    var allObjects = [ObjectItem(index: 0, name: "deer.jpg"), ObjectItem(index: 1, name: "Doreta")]
    
    
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
