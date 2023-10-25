//
//  ContentView.swift
//  GreetingCard
//
//  Created by 鄭宇婕 on 2023/10/11.
//

import SwiftUI

// set rgb color
let color_bg = Color(red: 237/255, green: 233/255, blue: 213/255)
let color_pink = Color(red: 231/255, green: 171/255, blue: 154/255)
let color_or = Color(red: 223/255, green: 120/255, blue: 87/255)
let color_gr = Color(red: 97/255, green: 113/255, blue: 67/255)


struct ContentView: View {
    
    @State var isPress = false

    var body: some View {
        ZStack{
            Color(color_bg) // set background color
            
            VStack {
                Text("It's Christmas Time!")
                    .font(.custom("SpecialElite-Regular", size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(color_gr)
                    .padding(.bottom, 40)
                
                Image("image_2")
                    .resizable() // fit screen
                    .scaledToFill() // 等比例
                    .frame(width: 300, height: 50)
                
                Image("image_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .padding(50)
                    
                Button(action: {
                    // click "party info"
                    isPress = true
                }) {
                    HStack {
                        Image(systemName: "giftcard.fill") // emoji
                        Text("party info")
                            .font(.custom("Lobster-Regular", size: 25))
                    }
                    .font(.title)
                }
                .buttonStyle(ButtonPartyInfo())
            }
        }
        // click button --> 跑出sheet
        .sheet(isPresented: $isPress) {
            getInfo()
        }
    }

    func getInfo() -> some View {
        return Group {
            Text("Party Information")
                .font(.custom("Lobster-Regular", size: 40))
                .foregroundColor(.white)
                .padding()
            
            Text("\nDate: 12/25\nTime: 19:00\nLocation: ndhu\n\nHappy Holidays~")
                .font(.custom("SpecialElite-Regular", size: 25))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .presentationDetents([.medium, .large]) // sheet 只佔 1/2 screen
                .presentationBackground(color_pink)
                .presentationCornerRadius(60) // sheet 圓角
            
            Button("OK") {
                // click OK -> turn off sheet
                isPress = false
            }
            .buttonStyle(ButtonOK())
            .padding()
        }
    }
}

// getInfo button
struct ButtonPartyInfo: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(color_or)
            .cornerRadius(40)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0) // 動畫: 點擊 縮小
    }
}

// OK button
struct ButtonOK: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 100)
            .fontWeight(.bold)
            .foregroundColor(color_pink)
            .background(.white)
            .cornerRadius(40)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ContenView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}


// original version
/*
struct ContentView: View {
    
    @State var isPress = false

    var body: some View {
        ZStack{
            Color(color_bg) // set background color
            
            VStack {
                Text("It's Christmas Time!")
                    .font(.custom("Corinthia-Regular", size: 60))
                    .foregroundColor(color_gr)
                    .multilineTextAlignment(.center)
                
                Image("image_2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 50)
                
                Image("image_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .padding(50)
                    

                
                Button {
                    isPress = true
                } label: {
                    // appreance
                    HStack {
                        Image(systemName: "giftcard.fill")
                        Text("party info")
                    }
                    .font(.title)
                }
                .buttonStyle(MybuttonStyle())
                .alert(isPresented: $isPress, content: {
                    Alert(title: Text("Party info"), message:
                            Text("\nDate: 12/25\nTime: 19:00\nLocation: ndhu\n\nwe wish you a merry christmas~"), dismissButton: .default(Text("ok"))) //$isPress reset to false
                    
                })
            }
        }

    }
}*/
