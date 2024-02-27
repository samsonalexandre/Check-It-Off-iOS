//
//  LocationManager.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 26.02.24.
//

import Foundation // Für grundlegende Foundation-Bibliothek
import CoreLocation // Für die Standortverwaltung
import Combine // Für die Verwendung von Combine-Framework zur Reaktivprogrammierung

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var location: CLLocation?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
