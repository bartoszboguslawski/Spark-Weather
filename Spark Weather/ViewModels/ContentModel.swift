import Foundation
import CoreLocation

@MainActor
class ContentModel: ObservableObject {
    
    @Published var weather: WeatherModel?
    private let apiKey = "8cd85afd22fa71f4a1cf3742e523938f"
    
    
    func getData(lat: CLLocationDegrees, lon: CLLocationDegrees) async {
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(lon)&exclude=alerts&appid=\(apiKey)") else {
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
