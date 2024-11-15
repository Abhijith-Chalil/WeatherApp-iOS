//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Abhijith Chalil on 14/11/24.
//

import SwiftUI

struct WeatherButton: View {
    
    var title : String
    var textColor : Color
    var backgroundColor : Color
    var body: some View {
        Text(title).frame(width: 280, height: 50).background(backgroundColor).foregroundColor(textColor).font(.system(size: 20, weight: .bold,design: .default)).cornerRadius(10)
        
    }
}

#Preview {
    WeatherButton(title: "Test Title", textColor: .white, backgroundColor: .blue)
}
