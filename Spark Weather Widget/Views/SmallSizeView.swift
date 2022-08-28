import WidgetKit
import SwiftUI

struct SmallSizeView: View {
    
    var entry: SimpleEntry
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                HStack {
                    Text("26")
                    Image(systemName: "sun.max")
                }
            }
        }
    }
}
