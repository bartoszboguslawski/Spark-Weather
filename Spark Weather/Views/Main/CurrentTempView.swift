//
//  CurrentTempView.swift
//  Spark Weather
//
//  Created by Bartosz Bogusławski on 28/08/2022.
//

import SwiftUI

struct CurrentTempView: View {
    
    var model: WeatherModel

    var body: some View {
        VStack {
            Text(model.timezone ?? "Location not specified")
                .font(.title)
            HStack {
                if model.current?.weather != nil {
                    ForEach(model.current!.weather!) { id in
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(id.icon ?? "")@2x.png")) { image in
                            image
                                .resizable()
                                .frame(width: 120, height: 120)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                Spacer()
                Text("\(round(model.current?.temp ?? 0), specifier: "%g")°")
                    .font(.system(size: 80, weight: .regular, design: .default))
            }
            .padding(.horizontal, 40.0)
            if model.current?.weather != nil {
                ForEach(model.current!.weather!) { r in
                    Text(r.main ?? "")
                        .font(.title2)
                }
            }
        }
        .foregroundColor(Color.theme.secondaryColor)
    }
}
