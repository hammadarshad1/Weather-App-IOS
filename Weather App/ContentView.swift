//
//  ContentView.swift
//  Weather App
//
//  Created by Muhammad Hammad on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("Karachi, Pakistan")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageSystemName: "cloud.sun.fill",
                                   temperature: 76)

                    WeatherDayView(dayOfWeek: "WED",
                                   imageSystemName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageSystemName: "cloud.sun.rain.fill",
                                   temperature: 69)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageSystemName: "wind.snow",
                                   temperature: 70)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageSystemName: "sun.max.fill",
                                   temperature: 75)
                }
                
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.blue)
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {

    var dayOfWeek: String
    var imageSystemName: String
    var temperature: Int

    init(dayOfWeek: String, imageSystemName: String, temperature: Int) {
        self.dayOfWeek = dayOfWeek
        self.imageSystemName = imageSystemName
        self.temperature = temperature
    }
    
    var body: some View {
        VStack(spacing: 3) {
            Text(self.dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: self.imageSystemName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(self.temperature)°")
                .font(.system(size: 28))
                .foregroundColor(.white)
        }
    }
}
