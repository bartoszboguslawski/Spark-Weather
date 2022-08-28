//
//  Background.swift
//  Spark Weather WidgetExtension
//
//  Created by Bartosz Bogusławski on 28/08/2022.
//

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color.theme.background1,
            Color.theme.background2]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}
