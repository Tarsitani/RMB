//
//  ObjectList.swift
//  remember-project
//
//  Created by Lucas Tarsitani on 03/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit


protocol ObjectListDisplay: NSObjectProtocol {
    
    func display(imageName: String)
    
}

var objectLibrary = ListObjectsMenu()


struct Object{
    var objectName: String
}


class ObjectListOnLocalizationScreen: NSObject {
    
    //Will be set a list of pressed objects buttons to show on LocalizationScreen
    public private(set) var listOfObjects = [Object]()
    
    public weak var delegate: ObjectListDisplay?
    
    //Receive from buttonScreen an objecte, that was pressed, and add it to the listo of objects to be remeber in localizationScreen
    func addItem(objectPressed: String){
        let newObject = Object(objectName: objectPressed)
        
        listOfObjects.append(newObject)
    }
    
    //falta setar o display para a lista de objetos aparecerem
    
    
    
}
