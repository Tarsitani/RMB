//
//  Geotification.swift
//  remember-project
//
//  Created by Mauricio Lorenzetti on 07/04/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

struct GeoKey {
	static let latitude = "latitude"
	static let longitude = "longitude"
	static let radius = "radius"
	static let identifier = "identifier"
	static let note = "note"
	static let eventType = "eventType"
	static let items = "items"
}

enum EventType: String {
	case onEntry = "On Entry"
	case onExit = "On Exit"
}

class Geotification: NSObject, NSCoding, MKAnnotation {
	
	var coordinate: CLLocationCoordinate2D
	var radius: CLLocationDistance
	var identifier: String
	var note: String // TODO delete
	var eventType: EventType // TODO delete

	var title: String? {
		if note.isEmpty {
			return "No Note"
		}
		return note
	}
	
	var subtitle: String? {
		let eventTypeString = eventType.rawValue
		return "Radius: \(radius)m - \(eventTypeString)"
	}
	
	var items: [Item] = []
	
	init(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance, identifier: String, note: String, eventType: EventType, items: [Item]) {
		self.coordinate = coordinate
		self.radius = radius
		self.identifier = identifier
		self.note = note
		self.eventType = eventType
		self.items = items
	}
	
	// MARK: NSCoding
	required init?(coder decoder: NSCoder) {
		let latitude = decoder.decodeDouble(forKey: GeoKey.latitude)
		let longitude = decoder.decodeDouble(forKey: GeoKey.longitude)
		coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		radius = decoder.decodeDouble(forKey: GeoKey.radius)
		identifier = decoder.decodeObject(forKey: GeoKey.identifier) as! String
		note = decoder.decodeObject(forKey: GeoKey.note) as! String
		eventType = EventType(rawValue: decoder.decodeObject(forKey: GeoKey.eventType) as! String)!
		items = (decoder.decodeObject(forKey: GeoKey.items) as! [Item])
	}
	
	func encode(with coder: NSCoder) {
		coder.encode(coordinate.latitude, forKey: GeoKey.latitude)
		coder.encode(coordinate.longitude, forKey: GeoKey.longitude)
		coder.encode(radius, forKey: GeoKey.radius)
		coder.encode(identifier, forKey: GeoKey.identifier)
		coder.encode(note, forKey: GeoKey.note)
		coder.encode(eventType.rawValue, forKey: GeoKey.eventType)
		//coder.encodeObject(items, forkey: GeoKey.items)
		coder.encode(items,forKey:GeoKey.items)
	}
	
}
