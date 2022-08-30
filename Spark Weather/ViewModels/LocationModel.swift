import Foundation
import CoreLocation
import WidgetKit

class LocationModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    private var locationManager = CLLocationManager()
    @Published var auth = CLLocationManager().authorizationStatus
    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
            WidgetCenter.shared.reloadAllTimelines()
            auth = .authorizedWhenInUse
        } else if locationManager.authorizationStatus == .denied {
            auth = .denied
        } else if locationManager.authorizationStatus == .notDetermined {
            auth = .notDetermined
        }
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            location = locations.first!.coordinate
            print("Coordinates received.")
            locationManager.stopUpdatingLocation()
        }
    }
    
}
