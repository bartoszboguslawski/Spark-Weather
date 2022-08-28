//
//  Spark_Weather_Widget.swift
//  Spark Weather Widget
//
//  Created by Bartosz Bogusławski on 28/08/2022.
//

import WidgetKit
import SwiftUI

@main
struct Spark_Weather_Widget: Widget {
    let kind: String = "Spark_Weather_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .configurationDisplayName("Spark Weather Widget")
        .description("Get quick access to the weather.")
    }
}
