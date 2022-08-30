import WidgetKit
import CoreLocation
import SwiftUI

struct Provider: TimelineProvider {
    
    @ObservedObject var locationmodel = LocationModel()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), weather: nil)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        Task {
            do {
                if let location = locationmodel.location {
                    
                    let weather = try await ContentModel.shared.getData(lat: location.latitude, lon: location.longitude)
                    let entry = SimpleEntry(date: .now, weather: weather)
                    
                    completion(entry)
                    print("do")
                }
            } catch {
                completion(SimpleEntry(date: .now, weather: nil))
                print("catch")
            }
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        locationmodel.requestLocation()
        Task {
            do {
                if let location = locationmodel.location {
                    let weather = try await ContentModel.shared.getData(lat: location.latitude, lon: location.longitude)
                    let entry = SimpleEntry(date: .now, weather: weather)
                    let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 60)))
                    print("do")

                    completion(timeline)
                }
            } catch {
                let entry = SimpleEntry(date: .now, weather: nil)
                let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 60)))
                print("catch")
                completion(timeline)
            }
        }
    }
}
