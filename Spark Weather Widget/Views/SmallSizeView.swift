import WidgetKit
import SwiftUI

struct SmallSizeView: View {
    
    var entry: SimpleEntry
    
    var body: some View {
        ZStack {
            Background()
            if let weather = entry.weather {
                VStack {
                    HStack {
                        Text("\(round(weather.current?.temp ?? 0), specifier: "%g")°")                            .font(.system(size: 40))
                        Spacer()
                        Image(systemName: "sun.max")
                            .frame(width: 40, height: 40)
                            .scaledToFit()
                    }
                    if weather.current?.weather != nil {
                        ForEach(weather.current!.weather!) { r in
                            Text(r.main ?? "")
                                .font(.title2)
                        }
                    }
                }
                .padding()
                .foregroundColor(Color.theme.secondaryColor)
            }
        }
    }
}
