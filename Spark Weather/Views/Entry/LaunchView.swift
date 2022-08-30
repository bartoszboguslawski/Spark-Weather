import SwiftUI

struct LaunchView: View {
    
    @StateObject var locations = LocationModel()
    @State var weather: WeatherModel?
    
    var body: some View {
        if locations.auth == .authorizedWhenInUse {
            if let location = locations.location {
                if let weather = weather {
                    MainView(model: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await ContentModel.shared.getData(lat: location.latitude, lon: location.longitude)
                            } catch {
                                print(error)
                            }
                        }
                }
            }
        } else if locations.auth == .denied {
            ForbiddenView()
        } else if locations.auth == .notDetermined {
            LoadingView()
        }
    }
}

