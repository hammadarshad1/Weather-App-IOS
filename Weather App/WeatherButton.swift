//
//  WeatherButton.swift
//  Weather App
//
//  Created by Muhammad Hammad on 07/12/2023.
//

import SwiftUI

struct WeatherButtonText: View {
    
    var buttonTitle: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        Text(self.buttonTitle)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(self.foregroundColor)
            .frame(width: 280, height: 50)
            .background(self.backgroundColor)
            .cornerRadius(10)
    }
}

struct WeatherButton_Preview: PreviewProvider {
    static var previews: some View {
        WeatherButtonText(buttonTitle: "Test Title", 
                          backgroundColor: .blue,
                          foregroundColor: .white)
    }
}
