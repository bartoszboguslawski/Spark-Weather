import WidgetKit
import SwiftUI

struct MediumSizeView: View {
    
    var entry: SimpleEntry

    var body: some View {
        ZStack {
            Background()
            if let weather = entry.weather {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(weather.timezone ?? "Location not specified")
                                .font(.system(size: 14))
                            Text("\(round(weather.current?.temp ?? 0), specifier: "%g")°")
                                .font(.system(size: 40))
                        }
                        .padding(.horizontal)
                        .padding(.top, 5)
                        Spacer()
                        VStack(alignment: .trailing) {
                            ForEach(weather.current!.weather!) { id in
                                Image(String(id.icon ?? ""))
                                    .frame(width: 20, height: 20)
                                    .scaledToFit()
                                    .padding(.trailing, 10)
                            }
                            ForEach(weather.current!.weather!) { r in
                                Text(r.main ?? "")
                                    .font(.system(size: 15))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 5)
                    }
                    HStack {
                        if let hours = weather.hourly {
                            ForEach(hours.prefix(6)) { hour in
                                VStack {
                                    if let time = TimeInterval(hour.dt ?? 0) {
                                    Text("\(Date(timeIntervalSince1970: time).formatted(.dateTime.hour()))")
                                            .font(.system(size: 10))
                                    }
                                    if weather.current != nil {
                                        ForEach(weather.current!.weather!) { id in
                                            Image(String(id.icon ?? ""))
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .scaledToFit()
                                        }
                                    Text("\(round(hour.temp ?? 0), specifier: "%g")°")
                                            .font(.system(size: 10))
                                    }
                                }
                                .padding(.horizontal, 10)
                                .padding(.bottom, 5)
                            }
                        }
                    }
                }
                .foregroundColor(Color.theme.secondaryColor)
            }
        }
    }
}
