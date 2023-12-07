//
//  ContentView.swift
//  Weather App
//
//  Created by Muhammad Hammad on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Karachi, Pakistan")
                
                WeatherStatusView(weatherImage: "cloud.sun.fill", temperature: 76)
                
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
                    isNight.toggle()
                } label: {
                    WeatherButtonText(buttonTitle: "Change Day Time",
                                      backgroundColor: .white,
                                      foregroundColor: .blue)
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
    
    var body: some View {
        VStack(spacing: 3) {
            Text(self.dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: self.imageSystemName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(self.temperature)°")
                .font(.system(size: 28))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {

    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {

    var cityName: String
    
    var body: some View {
        Text(self.cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStatusView: View {

    var weatherImage: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: self.weatherImage)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(self.temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
