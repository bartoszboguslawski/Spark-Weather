import SwiftUI

struct DailyRow: View {
    
    var model: WeatherModel
    var min: Double?
    var max: Double?
    var dt: Int?
    var weather: [Weather]?
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                if let time = TimeInterval(dt ?? 0) {
                    Text("\(Date(timeIntervalSince1970: time).formatted(.dateTime.weekday()))")
                        .font(.system(size: 20))
                }
                if weather != nil {
                    ForEach(weather!) { id in
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(id.icon ?? "")@2x.png")) { image in
                            image
                                .resizable()
                                .frame(width: 40, height: 40)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                Spacer()
                Text("\(round(min ?? 0), specifier: "%g")° / \(round(max ?? 0), specifier: "%g")°")
                    .font(.system(size: 20))
            }
            .padding(.horizontal, 35)
            .foregroundColor(Color.theme.secondaryColor)
        }
    }
}
