import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var content: ContentModel
    @StateObject var locations = LocationModel()
    
    var body: some View {
        if locations.auth == .authorizedWhenInUse {
            if let location = locations.location {
                if let model = content.weather {
                    MainView(model: model)
                } else {
                    ProgressView()
                        .task {
                            await content.getData(lat: location.latitude, lon: location.longitude)
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

