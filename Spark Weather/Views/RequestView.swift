//
//  EntryView.swift
//  Spark Weather
//
//  Created by Bartosz Bogusławski on 16/05/2022.
//

import SwiftUI

struct RequestView: View {
    
    @EnvironmentObject var model: LocationManager
    @State var showingMainView = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Welcome to the Spark Weather.")
                .font(.title)
                .fontWeight(.bold)
            Text("Please share your location in settings to access weather in your area.")
                .padding()
            
            Button {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            } label: {
                ZStack {
                    Rectangle()
                        
                    HStack {
                        Image(systemName: "location")
                        Text("Share your location")
                    }
                    .foregroundColor(.white)
                }
                .frame(width: 220, height: 50)
                .cornerRadius(10)
            }

        }
        .multilineTextAlignment(.center)
    }
}

struct RequestView_Previews: PreviewProvider {
    static var previews: some View {
        RequestView()
    }
}
