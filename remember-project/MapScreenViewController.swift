//
//  MapScreenViewController.swift
//  remember-project
//
//  Created by Matheus Garcia on 07/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol sendGeotificationCoordinates:NSObjectProtocol {
	func sendGeotificationCoordinates(coordinates: CLLocationCoordinate2D)
}

class MapScreenViewController: UIViewController {
	
	var delegate:sendGeotificationCoordinates?

	@IBOutlet weak var mapView: MKMapView!
	
    override func viewDidLoad() {
		super.viewDidLoad()
		let coordinate = mapView.centerCoordinate
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHome(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goBack", sender: self)
    }
}
