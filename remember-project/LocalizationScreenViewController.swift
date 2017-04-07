//
//  LocalizationScreenViewController.swift
//  remember-project
//
//  Created by Lucas Tarsitani on 03/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocalizationScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, SelectedItemsDelegate, sendGeotificationCoordinates {
	
	@IBOutlet weak var mapView: MKMapView!

	@IBOutlet weak var LocalizationScreenCollectionView: UICollectionView!
	@IBOutlet weak var objectNameLabel: UILabel!
	
	var geotification:Geotification?
	let locationManager = CLLocationManager()
	
    //var objectsImages = ListObjectsMenu()
    //var objectToRemeber = ObjectListOnLocalizationScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LocalizationScreenCollectionView.delegate = self
        self.LocalizationScreenCollectionView.dataSource = self
		locationManager.delegate = self
		locationManager.requestAlwaysAuthorization()
		
		geotification = Geotification(coordinate: CLLocationCoordinate2D(latitude: 37.422, longitude: -122.084058),
		                         radius: 300.0,
		                         identifier: ".",
		                         note: ".",
		                         eventType: .onExit)
		/*geotification?.items.append(Item(iconTitle: "01.jpg"))*/
		
		// TODO: serialize
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Get the number of objects that will be avaible to choose
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
		if geotification != nil {
			return geotification!.items.count
		}
		return 0
    }
    
    //take the images from reference and add your respective cell to the collectionView
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item_cell",  for: indexPath) as! LocalizationScreenCollectionViewCell
		
        cell.rememberScreenButton.setImage(UIImage(named: (geotification?.items[indexPath.row].iconTitle)!), for: UIControlState.normal)
		
		
		
        cell.layer.cornerRadius = 8
		
        return cell
    }
	
	@IBAction func unwindToLocalization(segue: UIStoryboardSegue) {
		
	}
	
	func appendSelectedItems(selectedItem:Item) {
		geotification?.items.append(selectedItem)
		LocalizationScreenCollectionView.reloadData()
	}
	
	func sendGeotificationCoordinates(coordinates: CLLocationCoordinate2D) {
		geotification?.coordinate = coordinates
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		let navigationController = segue.destination as! UINavigationController
		let itemViewController = navigationController.viewControllers[0] as! ButtonScreenViewController
		
		itemViewController.delegate = self
		
	}

}

// MARK: - Location Manager Delegate
extension LocalizationScreenViewController: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		mapView.showsUserLocation = (status == .authorizedAlways)
	}
	
	func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
		print("Monitoring failed for region with identifier: \(region!.identifier)")
	}
 
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Location Manager failed with the following error: \(error)")
	}
	
}








