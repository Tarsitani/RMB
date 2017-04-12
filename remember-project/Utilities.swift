//
//  Utilities.swift
//  remember-project
//
//  Created by Mauricio Lorenzetti on 07/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import Foundation
import UIKit
import MapKit

// MARK: Helper Extensions
extension UIViewController {
	func showAlert(withTitle title: String?, message: String?) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .destructive, handler: nil)
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}
}

extension MKMapView {
	func zoomToUserLocation() {
		guard let coordinate = userLocation.location?.coordinate else { return }
		let region = MKCoordinateRegionMakeWithDistance(coordinate, 2000, 2000)
		setRegion(region, animated: true)
	}
}
