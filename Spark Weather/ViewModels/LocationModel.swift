import Foundation
import CoreLocation

class LocationModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    private var locationManager = CLLocationManager()
    @Published var auth = CLLocationManager().authorizationStatus
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
            auth = .authorizedWhenInUse
        } else if locationManager.authorizationStatus == .denied {
            auth = .denied
        } else if locationManager.authorizationStatus == .notDetermined {
            auth = .notDetermined
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            location = locations.first!.coordinate
            print("Coordinates received.")
            locationManager.stopUpdatingLocation()
        }
    }
    
}
