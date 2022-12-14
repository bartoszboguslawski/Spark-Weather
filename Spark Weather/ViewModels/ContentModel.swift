import Foundation
import CoreLocation

class ContentModel: ObservableObject {
    
    private let apiKey = "2dc71d6c621cf96afd12b19fc208699f"
    static var shared = ContentModel()
    
    func getData(lat: CLLocationDegrees, lon: CLLocationDegrees) async throws -> WeatherModel {
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(lon)&exclude=alerts&units=metric&appid=\(apiKey)") else {
            print("Wrong URL")
            throw URLError(.badURL)
        }
        let(data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Wrong response code \((response as? HTTPURLResponse)?.statusCode ?? 0)")}
        
        let result = try JSONDecoder().decode(WeatherModel.self, from: data)
        return result
    }
}
