import WidgetKit
import SwiftUI

struct WidgetView: View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
            case .systemSmall:
                SmallSizeView(entry: entry)
            case .systemMedium:
                MediumSizeView(entry: entry)
            default:
                Text("Not implemented")
        }
    }
}
