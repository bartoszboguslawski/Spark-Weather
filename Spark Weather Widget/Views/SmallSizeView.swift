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
                        Text("\(round(weather.current?.temp ?? 0), specifier: "%g")°")
                            .font(.system(size: 50))
                        Spacer()
                    }
                    .padding(.horizontal, 20.0)
                    Spacer()
                    if weather.current?.weather != nil {
                        VStack {
                            HStack {
                                ForEach(weather.current!.weather!) { id in
                                    Image(String(id.icon ?? ""))
                                        .frame(width: 20, height: 20)
                                        .scaledToFit()
                                }
                                Spacer()
                            }
                            HStack {
                                ForEach(weather.current!.weather!) { r in
                                    Text(r.main ?? "")
                                        .font(.system(size: 15))
                                }
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 20.0)
                    }
                }
                .foregroundColor(Color.theme.secondaryColor)
                .padding(.vertical, 10.0)
            }
        }
    }
}
