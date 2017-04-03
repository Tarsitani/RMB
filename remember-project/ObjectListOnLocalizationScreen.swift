//
//  ObjectList.swift
//  remember-project
//
//  Created by Lucas Tarsitani on 03/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit


protocol ObjectListDisplay: NSObjectProtocol {
    
    func display(/*itemsTotal: Int,*/ imageName: String)
    
}

var objectList = ListObjectsMenu()

var objectLibrary = objectList.getObjectsList()


struct object{
    //var objectIndex: Int
    var objectClassification: String
}


class ObjectListOnLocalizationScreen: NSObject {
    
    //Will be set a list of pressed objects buttons to show on LocalizationScreen
    public private(set) var listOfObjects = [object]()
    
    public weak var delegate: ObjectListDisplay?
    
    //add the pressed item to the list of objects in the remeber(home) screen
    func addItem(objectPressed: String){
        let newObject = object(/*objectIndex: objectPressed,*/ objectClassification: String(objectLibrary[objectPressed]!))
        
        listOfObjects.append(newObject)
    }
    
    //falta setar o display para a lista de objetos aparecerem
    
    
    
}
