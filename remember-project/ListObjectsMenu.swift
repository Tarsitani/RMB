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
    
    //All objects buttons reference
    var objectsReference = [objectItem]
    
    
    func getObjectsList() -> [objectItem]{
        return objectsReference
    }
    
    //To add a new object in reference
    struct objectItem {
        var objectIndex: Int
        var objectName: String
    }
    
    func setNewObject(index: Int, name: String){
        var newObject = objectItem
        
        objectItem.objectIndex = index
        objectName = name
        
        objectsReference.append(newObject)
        
    }
}
