//
//  LocationFetcher.swift
//  Spy
//
//  Created by Paula Waleska on 23/2/25.
//

import CoreLocation

class LocationFetcher: NSObject, Plugin {
    weak var delegate: PluginDelegate?

    required override init() { }

    var name: String = "Location Fetcher"

    func execute() throws {
        print("Fetching location information...")

        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationFetcher: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Latitude: \(location.coordinate.latitude)")
            print("Longitude: \(location.coordinate.longitude)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to fetch location: \(error.localizedDescription)")
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Location access granted.")
            manager.startUpdatingLocation()
        case .denied, .restricted:
            print("Location access denied.")
        case .notDetermined:
            print("Location access not determined yet.")
        @unknown default:
            print("Unknown authorization status.")
        }
    }
}
