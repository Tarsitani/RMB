//
//  AppDelegate.swift
//  remember-project
//
//  Created by Lucas Tarsitani on 29/03/17.
//  Copyright © 2017 Lucas Tarsitani. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
	
	let locationManager = CLLocationManager()
	
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		locationManager.delegate = self as CLLocationManagerDelegate
		locationManager.requestAlwaysAuthorization()
		application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
		UIApplication.shared.cancelAllLocalNotifications()
		return true
    }
	
	func handleEvent(forRegion region: CLRegion!) {
		//Shows an alert if application is on the foreground
		if UIApplication.shared.applicationState == .active {
			guard let message = note(fromRegionIdentifier: region.identifier) else { return }
		window?.rootViewController?.showAlert(withTitle: nil, message: message)
		} else {
		//Shows a local notification
		let notification = UILocalNotification()
		notification.alertBody = note(fromRegionIdentifier: region.identifier)
		notification.soundName = "Default"
		UIApplication.shared.presentLocalNotificationNow(notification)
	  }
	}
	
	func note(fromRegionIdentifier identifier: String) -> String? {
		let savedItems = UserDefaults.standard.array(forKey: PreferencesKeys.savedItems) as? [NSData]
		let geotifications = savedItems?.map { NSKeyedUnarchiver.unarchiveObject(with: $0 as Data) as? Geotification }
		let index = geotifications?.index { $0?.identifier == identifier }
		if (index != nil) {
			var notificationContent: String = "Verify if you currently possess the following items:\n"
			for item in (geotifications?[index!]?.items)! {
				notificationContent.append(item.iconTitle!)
				if ((geotifications?[index!]?.items)!.last != item) {
					notificationContent.append(", ")
				}
			}
			return notificationContent
		} else {
			return nil
		}
	}

}

extension AppDelegate: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
		print("Monitoring failed for region with identifier: \(region!.identifier)")
	}
 
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Location Manager failed with the following error: \(error)")
	}
	
	//not used in this implementation
	func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
		if region is CLCircularRegion {
			handleEvent(forRegion: region)
		}
	}
		
	func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
		if region is CLCircularRegion {
			handleEvent(forRegion: region)
		}
	}
}
