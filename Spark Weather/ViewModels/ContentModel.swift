import Foundation
import CoreLocation

@MainActor
class ContentModel: ObservableObject {
    
    @Published var weather: WeatherModel?
    private let apiKey = "2dc71d6c621cf96afd12b19fc208699f"
    
    
    func getData(lat: CLLocationDegrees, lon: CLLocationDegrees) async {
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(lon)&exclude=alerts&units=metric&appid=\(apiKey)") else {
            print("URL error")
            return
        }
        do {
            let(data, response) = try await URLSession.shared.data(from: url)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Wrong response code \((response as? HTTPURLResponse)?.statusCode ?? 0)")}
            
            if let result = try? JSONDecoder().decode(WeatherModel.self, from: data) {
                weather = result
            }
        } catch {
            print(error)
        }
    }
}
