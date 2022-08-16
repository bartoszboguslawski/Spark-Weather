import SwiftUI

struct MainView: View {
    
    var model: WeatherModel
    
    var body: some View {
        ZStack {
            GradientBackground()
            ScrollView {
                VStack {
                    TabView {
                        Tab1View(model: model)
                        Tab2View(model: model)
                    }
                    .frame(height: 250, alignment: .center)
                    .cornerRadius(10)
                    .tabViewStyle(PageTabViewStyle())
                    .padding()
                    .foregroundColor(Color.theme.tabcolor)
                    
                    ScrollView(.horizontal) {
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
                }
            }
        }
    }
}


