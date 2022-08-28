//
//  DetailedView.swift
//  Spark Weather
//
//  Created by Bartosz Bogusławski on 28/08/2022.
//

import SwiftUI

struct DetailedView: View {
    
    var model: WeatherModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Feels like:")
                Spacer()
                Text("\(round(model.current!.feelsLike ?? 0), specifier: "%g")°")
            }
            Divider()
            HStack {
                Text("Pressure:")
                Spacer()
                Text("\(model.current!.pressure ?? 0) hPa")
            }
            Divider()
            HStack {
                Text("Wind:")
                Spacer()
                Text("\(model.current!.windSpeed ?? 0, specifier: "%g") km/h")
            }
            Divider()
            HStack {
                Text("Visibility:")
                Spacer()
                Text("\((model.current!.visibility ?? 0)/1000) km")
            }
            Divider()
            HStack {
                Text("Humidity:")
                Spacer()
                Text("\(model.current!.humidity ?? 0) %")
            }
        }
        .font(.system(size: 20))
        .foregroundColor(Color.theme.secondaryColor)
        .padding(.horizontal, 35.0)
        .padding(.vertical)
    }
}
