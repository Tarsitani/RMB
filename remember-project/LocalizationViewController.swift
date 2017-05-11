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

struct PreferencesKeys {
	static let savedItems = "savedItems"
}

class LocalizationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	let reuseIdentifier = "cell"
	
	@IBOutlet weak var mapView: MKMapView!
	
	@IBOutlet weak var localizationCollectionView: UICollectionView!
	
	var geotifications = [Geotification]()
	let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		mapView.delegate = self
		mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
		mapView.zoomToUserLocation()
		
		localizationCollectionView.delegate = self
		localizationCollectionView.dataSource = self
		
		locationManager.delegate = self
		locationManager.requestAlwaysAuthorization()
		
		//createDefaultGeotification()
		//saveAllGeotifications()
		
		loadAllGeotifications()
    }
	
	func createDefaultGeotification() {
		let g = Geotification(coordinate: CLLocationCoordinate2D(latitude: -22.812749, longitude: -47.065614),
		                      radius: 1000.0,
		                      identifier: "Test",
		                      note: "Test",
		                      eventType: .onExit,
		                      items: [Item(iconTitle: "Backpack")])
		add(geotification: g)
	}
	
	// MARK: Loading and saving functions
	func loadAllGeotifications() {
		geotifications = []
		guard let savedItems = UserDefaults.standard.array(forKey: PreferencesKeys.savedItems) else { return }
		for savedItem in savedItems {
			guard let geotification = NSKeyedUnarchiver.unarchiveObject(with: savedItem as! Data) as? Geotification else { continue }
			add(geotification: geotification)
		}
	}
	
	func saveAllGeotifications() {
		var items: [Data] = []
		for geotification in geotifications {
			let item = NSKeyedArchiver.archivedData(withRootObject: geotification)
			items.append(item)
		}
		UserDefaults.standard.set(items, forKey: PreferencesKeys.savedItems)
	}
	
	// MARK: Functions that update the model/associated views with geotification changes
	func add(geotification: Geotification) {
		geotifications.insert(geotification, at: 0)
		mapView.addAnnotation(geotification)
		addRadiusOverlay(forGeotification: geotification)
	}
	
	func remove(geotification: Geotification) {
		if let indexInArray = geotifications.index(of: geotification) {
			geotifications.remove(at: indexInArray)
		}
		mapView.removeAnnotation(geotification)
		removeRadiusOverlay(forGeotification: geotification)
	}
	
	// MARK: Map overlay functions
	func addRadiusOverlay(forGeotification geotification: Geotification) {
		if (mapView != nil) {
			mapView?.add(MKCircle(center: geotification.coordinate, radius: geotification.radius))
		}
	}
	
	func removeRadiusOverlay(forGeotification geotification: Geotification) {
		// Find exactly one overlay which has the same coordinates & radius to remove
		guard let overlays = mapView?.overlays else { return }
		for overlay in overlays {
			guard let circleOverlay = overlay as? MKCircle else { continue }
			let coord = circleOverlay.coordinate
			if coord.latitude == geotification.coordinate.latitude && coord.longitude == geotification.coordinate.longitude && circleOverlay.radius == geotification.radius {
				mapView?.remove(circleOverlay)
				break
			}
		}
	}
	
	@IBAction func zoomToCurrentLocation(_ sender: UIButton) {
		mapView.zoomToUserLocation()
	}
	
	//Creates a CLCircularRegion for a given Geotification
	func region(withGeotification geotification: Geotification) -> CLCircularRegion {
		let region = CLCircularRegion(center: geotification.coordinate, radius: geotification.radius, identifier: geotification.identifier)
		region.notifyOnEntry = (geotification.eventType == .onEntry)
		region.notifyOnExit = !region.notifyOnEntry
		return region
	}
	
	func startMonitoring(geotification: Geotification) {
		if !CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
			showAlert(withTitle: "Error", message: "Geographic monitoring not available on this device")
			return
		}
		if CLLocationManager.authorizationStatus() != .authorizedAlways {
			showAlert(withTitle: "Warning", message: "You must grant this app permission to access this device location in order to get the notifications to work properly")
		}
		let region = self.region(withGeotification: geotification)
		locationManager.startMonitoring(for: region)
	}
	
	func stopMonitoring(geotification: Geotification) {
		for region in locationManager.monitoredRegions {
			guard let circularRegion = region as? CLCircularRegion, circularRegion.identifier == geotification.identifier else { return }
			locationManager.stopMonitoring(for: circularRegion)
		}
	}
	
	@IBAction func unwindToLocalization(segue: UIStoryboardSegue) {
	}
	
    //Tell the collection view the amount of cells to create
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
		guard !geotifications.isEmpty else { return 0 }
		return geotifications[0].items.count
    }
	
    //Creates each cell properly
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,  for: indexPath) as! ItemCollectionViewCell
		let selectedColor = UIColor(red: 0.3451, green: 0.3373, blue: 0.8392, alpha: 1.0)
		
		let itemPath = (geotifications[0].items[indexPath.row].iconTitle)!
		
		cell.itemImage.image = UIImage(named: itemPath)
		cell.itemImage.tintColor = selectedColor
		cell.itemName.text = itemPath
		cell.item = ItemsDB.getItemByIconTitle(title: itemPath)
		
        cell.layer.cornerRadius = 8
	
        return cell
    }
	
	//Removes cell on touch
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath) as! ItemCollectionViewCell
		let itemName = cell.itemName.text
		
		for item in geotifications[0].items {
			if item.iconTitle == itemName {
				geotifications[0].items.remove(at: geotifications[0].items.index(of: item)!)
				saveAllGeotifications()
				break
			}
		}
		if (geotifications[0].items.isEmpty) {
				showAlert(withTitle: "Warning", message: "This will delete the current geotification.")
				stopMonitoring(geotification: geotifications[0])
				remove(geotification: geotifications[0])
				saveAllGeotifications()
		}

		collectionView.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "toChoose") {
			let vc = segue.destination as! ButtonScreenViewController
			if (!geotifications.isEmpty) {
				vc.selectedItems = geotifications[0].items
			}
			vc.delegate = self
		}
	}
}

//MARK: AddGeotificationViewControllerDelegate
extension LocalizationViewController: AddGeotificationViewControllerDelegate {
	
	func addGeotification(coordinate: CLLocationCoordinate2D, radius: Double, identifier: String, note: String, eventType: EventType, items: [Item]) {
		let newGeotification = Geotification(coordinate: coordinate, radius: radius, identifier: "Current Geotification", note: "Current Geotification", eventType: .onExit, items: items)
		if (geotifications.isEmpty) {
			add(geotification: newGeotification)
			startMonitoring(geotification: newGeotification)
		} else {
			for newItem in items {
				if (geotifications[0].items.contains { (item) -> Bool in
					item.iconTitle == newItem.iconTitle
				}){ continue } else {
					geotifications[0].items.append(newItem)
				}
			}
			stopMonitoring(geotification: geotifications[0])
			remove(geotification: geotifications[0])
			add(geotification: newGeotification)
			startMonitoring(geotification: newGeotification)
		}
		saveAllGeotifications()
		localizationCollectionView.reloadData()
	}
	
	func manageSelectedItems(item: Item) {
		if (!geotifications.isEmpty && !geotifications[0].items.isEmpty) {
			for geoItem in geotifications[0].items {
				if (geoItem.iconTitle == item.iconTitle) {
					geotifications[0].items.remove(at: geotifications[0].items.index(of: geoItem)!)
					localizationCollectionView.reloadData()
					return
				}
			}
			geotifications[0].items.append(item)
		}
		localizationCollectionView.reloadData()
	}
}

// MARK: - Location Manager Delegate
extension LocalizationViewController: CLLocationManagerDelegate {
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

// MARK: - MapView Delegate
extension LocalizationViewController: MKMapViewDelegate {
	
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		let identifier = "myGeotification"
		if annotation is Geotification {
			var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
			if annotationView == nil {
				annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
				annotationView?.canShowCallout = true
				/*
				let removeButton = UIButton(type: .custom)
				removeButton.frame = CGRect(x: 0, y: 0, width: 23, height: 23)
				removeButton.setImage(UIImage(named: "Hand")!, for: .normal)
				annotationView?.leftCalloutAccessoryView = removeButton
				*/
			} else {
				annotationView?.annotation = annotation
			}
			return annotationView
		}
		return nil
	}
	
	func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
		if overlay is MKCircle {
			let circleRenderer = MKCircleRenderer(overlay: overlay)
			let selectedColor = UIColor(red: 0.3451, green: 0.3373, blue: 0.8392, alpha: 1.0)
			circleRenderer.lineWidth = 1.0
			circleRenderer.strokeColor = selectedColor
			circleRenderer.fillColor = selectedColor.withAlphaComponent(0.4)
			return circleRenderer
		}
		return MKOverlayRenderer(overlay: overlay)
	}
	
	// Delete geotification
	func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
		let geotification = view.annotation as! Geotification
		stopMonitoring(geotification: geotification)
		remove(geotification: geotification)
		saveAllGeotifications()
		localizationCollectionView.reloadData()
	}
	
}
