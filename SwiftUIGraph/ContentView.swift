//
//  ContentView.swift
//  SwiftUIGraph
//
//  Created by Ian Talisic on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State var segmentedSelection = 0
    @State var dataSource: [[CGFloat]] = [
        [100, 90, 39, 160, 70, 190, 50],
        [20, 100, 80, 190, 50, 50, 20],
        [160, 70, 190, 50, 100, 90, 39]
    ]
    
    let spacing: CGFloat = 16
    let width: CGFloat =  (UIScreen.main.bounds.width - 48 - (16 * 6)) / 7
    let height: CGFloat = (UIScreen.main.bounds.width - 48)  * 0.70
    
    var body: some View {
        ZStack {
            
            Color("green")
                .ignoresSafeArea()
            VStack {
                Text("Calory Intake")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $segmentedSelection, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack(spacing: spacing) {
                    BarView(value: dataSource[segmentedSelection][0], label: "Mon", width: width, height: height)
                    BarView(value: dataSource[segmentedSelection][1], label: "Tue", width: width, height: height)
                    BarView(value: dataSource[segmentedSelection][2], label: "Wed", width: width, height: height)
                    BarView(value: dataSource[segmentedSelection][3], label: "Thu", width: width, height: height)
                    BarView(value: dataSource[segmentedSelection][4], label: "Fri", width: width, height: height)
                    BarView(value: dataSource[segmentedSelection][5], label: "Sat", width: width, height: height)
                    BarView(value: dataSource[segmentedSelection][6], label: "Sun", width: width, height: height)
                }
                .padding(.top, 24)
                .animation(.default)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BarView: View {
    
    var value: CGFloat
    var label: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: width, height: height)
                    .foregroundColor(Color("bar_background"))
                Capsule().frame(width: width, height: value)
                    .foregroundColor(Color("bar_color"))
                
            }
            
            Text(label).padding(.top, 8)
        }
    }
}
