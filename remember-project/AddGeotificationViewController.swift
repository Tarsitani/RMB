//
//  AddGeotificationViewController.swift
//  remember-project
//
//  Created by Mauricio Lorenzetti on 11/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit
import MapKit

protocol AddGeotificationViewControllerDelegate {
	
	func addGeotification(coordinate: CLLocationCoordinate2D, radius: Double, identifier: String, note: String, eventType: EventType, items: [Item])
}

class AddGeotificationViewController: UIViewController {
	
	var delegate: AddGeotificationViewControllerDelegate?
	var items: [Item]?
	
	var radius: Double = 100.0 {
		willSet(changedValue) {
			if (abs(radius - changedValue) >= 10.0) {
				drawOverlayCircle()
			}
		}
	}
	var circleOverlay: MKCircle?
	
	@IBOutlet weak var radiusSlider: UISlider!
	@IBOutlet weak var mapView: MKMapView!
	
	@IBAction func zoomToCurrentLocation(_ sender: UIButton) {
		mapView.zoomToUserLocation()
	}
	
	@IBAction func radiusSliderChanged(_ sender: UISlider) {
		radius = Double(radiusSlider.value)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.mapView.delegate = self
		self.mapView.zoomToUserLocation()
		drawOverlayCircle()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		delegate?.addGeotification(coordinate: mapView.centerCoordinate, radius: radius, identifier: "default", note: "default", eventType: .onExit, items: items!)
	}
	
	@IBAction func unwindToHome(_ sender: UIBarButtonItem) {
		self.performSegue(withIdentifier: "goBack", sender: self)
	}
	
	func drawOverlayCircle() {
		self.mapView.removeOverlays(self.mapView.overlays)
		circleOverlay = MKCircle(center: mapView.centerCoordinate, radius: radius)
		self.mapView.add(circleOverlay!)
	}

}

extension AddGeotificationViewController: MKMapViewDelegate {
	
	func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
		if overlay is MKCircle {
			let circleRenderer = MKCircleRenderer(overlay: overlay)
			circleRenderer.lineWidth = 1.0
			circleRenderer.strokeColor = .purple
			circleRenderer.fillColor = UIColor.purple.withAlphaComponent(0.4)
			return circleRenderer
		}
		return MKOverlayRenderer(overlay: overlay)
	}
	
	public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
		drawOverlayCircle()
	}
}
