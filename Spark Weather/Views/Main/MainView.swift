import SwiftUI

struct MainView: View {
    
    var model: WeatherModel
    
    var body: some View {
        ZStack {
            GradientBackground()
            ScrollView(showsIndicators: false) {
                VStack {
                    CurrentTempView(model: model)
                        .padding(.vertical, 40)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            if model.hourly != nil {
                                ForEach(model.hourly!.prefix(24)) { hour in
                                    HourlyRow(model: model, dt: hour.dt ?? 0, temp: hour.temp ?? 0, weather: hour.weather)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    if model.daily != nil, model.current?.temp != nil {
                        ForEach(model.daily!) { day in
                            DailyRow(model: model, min: day.temp!.min, max: day.temp!.max, dt: day.dt, weather: day.weather)
                        }
                    }
                    Divider()
                    DetailedView(model: model)
                }
            }
        }
    }
}


