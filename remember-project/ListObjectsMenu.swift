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
    
    
    
    //list of objects that will appear in buttonScreen
    var allObjects = [ObjectItem]()
    
    
    func getObjectName(indexPath: Int) -> String{
        return allObjects[indexPath].objectName
    }
    
    func getAllObjectsSize() -> Int{
        return allObjects.count
    }
    
    //Object in reference. Index: image position in objectsReference. Name: the same name of the image, to print it in the screen
    struct ObjectItem {
        var objectIndex: Int
        var objectName: String
    }
    
    //It will add a new item in reference
    func setNewObject(index: Int, name: String){
        let newObject = ObjectItem(objectIndex: index, objectName: name)
        
        allObjects.append(newObject)
        
    }
}
