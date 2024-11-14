//
//  ContentView.swift
//  WeatherApp
//
//  Created by Abhijith Chalil on 09/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    let weatherArray = [
        WeatherData(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 76),
        WeatherData(dayOfWeek: "WED", imageName: "sun.max.fill", temp: 88),
        WeatherData(dayOfWeek: "THU", imageName: "wind.snow", temp: 55),
        WeatherData(dayOfWeek: "FRI", imageName: "sunset.fill", temp: 60),
        WeatherData(dayOfWeek: "SAT", imageName: "snow", temp: 25)
    ]

    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight)
            VStack{
                CityName(cityName: "Calicut, KL")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                
                
                HStack(spacing: 20) {
                    ForEach(weatherArray, id: \.dayOfWeek){ weatherData in
                        WeatherDayView(weatherData: weatherData)
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: Color.white)
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
    
    var weatherData : WeatherData
    
    var body: some View {
        
        VStack{
            Text(weatherData.dayOfWeek).font(.system(size: 16, weight: .medium,design: .default)).foregroundStyle(.white)
            Image(systemName: weatherData.imageName).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 40,height: 40)
            Text("\(weatherData.temp)°").font(.system(size: 28,weight: .medium)).foregroundColor(.white)
        }
        
    }
}

struct BackgroundView: View {
   @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint:             .bottomTrailing).ignoresSafeArea()
    }
}

struct CityName: View {
    var cityName: String
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white)
    }
}

struct MainWeatherStatusView: View {
    var imageName : String
    var temp: Int
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 180,height: 180)
            Text("\(temp)°").font(.system(size: 70,weight: .medium)).foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherData {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
}
