import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), weather: nil)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        Task {
            let weather = await ContentModel.shared.weather
            let entry = SimpleEntry(date: .now, weather: weather)
            
            completion(entry)
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        Task {
            let weather = await ContentModel.shared.weather
            let entry = SimpleEntry(date: .now, weather: weather)
            
            let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 60)))
            
            completion(timeline)
        }
    }
}
