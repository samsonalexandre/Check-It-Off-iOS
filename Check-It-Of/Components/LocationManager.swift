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
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Fehler beim Abrufen des Standorts", error)
        isLoading = false
    }
}
