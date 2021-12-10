//
//  FilterOptions.swift
//  firstapp (iOS)
//
//  Created by ryo fuj on 12/9/21.
//

import SwiftUI

struct FilterItem: Identifiable {
    let id = UUID()
    let dollarsigns: String
    let categories: String
}
struct FilterOptions: View {
    @State private var miles: Double = 0
    @State private var selection = 0
//    @State private var numberSelection = Selection.numberone
//    var selection: Int

    var body: some View {
        ZStack{
            VStack(alignment: .center) {
                HStack {
                    ForEach(options) { o in
                        GrayButton(labeltext: o.dollarsigns)
                        Spacer()
                    }
                }
                .padding([.top, .leading], 20)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(options) { o in
                            GrayButton(labeltext: o.categories)
                                .padding(.trailing, 8.0)
                        }
                    }
                }
                .padding([.top, .leading], 20)
                VStack{
                    Slider(value: $miles, in: 1...30,  step: 1)
                        .accentColor(Color.black)
                        .frame(height: 30)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .padding([.top, .leading, .trailing], 20)
                        
                    Text("\(miles, specifier: "%.0f") miles")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.white)
                }
                HStack{
                    Picker("", selection: $selection) {
                        ForEach(1...5, id: \.self) {
                            Text("\($0)")
                                .font(.system(size: 26, weight: .bold, design: .default))
                                .foregroundColor(.white)
                        }
                    }
                    Text("selection")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.white)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color(red: 0/255, green: 0/255, blue: 0/255))
            .modifier(CardModifier())
//            .padding(.all, 0)
            VStack {
                HStack {
                    Text("Filter")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .frame(width: 105, height: 35, alignment: .center)
                        .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 0)
//                        .offset(y: -50)
                    Spacer()
                }
                Spacer()
            }
        }
        .padding(.horizontal,10)
        .padding(.bottom,20)
    }
}

struct FilterOptions_Previews: PreviewProvider {
    static var previews: some View {
        FilterOptions()
    }
}
