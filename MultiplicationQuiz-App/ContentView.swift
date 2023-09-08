//
//  ContentView.swift
//  MultiplicationQuiz-App
//
//  Created by Lyu Hiroyama on 2023/09/08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var speed = 5.0
    @State private var isEditing = false
    @State private var pickerSelection = 1
    @State private var playMode = false
    @State private var pushAnimationAmount = 1.0

//text your multpilcation
    var body: some View {
    
        ZStack {
            
            VStack {
                
                Spacer()
                
                Text("Multiples of:")
                Text("\(speed.formatted())")
                    .font(.system(size:100).weight(.bold))
                
                
                Slider(
                    value: $speed,
                    in: 0...20,
                    step: 1
                ) {
                    Text("Speed")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("20")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                
                Text("# of Questions:")
                
                Picker("Number of questions", selection: $pickerSelection) {
                    Text("5").tag(0)
                    Text("10").tag(1)
                    Text("15").tag(2)
                }//Picker
                .pickerStyle(.segmented)
                
                Spacer()
                
                Button() {
                    withAnimation {
                        playMode.toggle()
                    }
                } label: {
                    Image(systemName: "gamecontroller")
                }
                .font(.largeTitle)
                .overlay(
                    Circle()
                        .stroke(.blue)
                        .frame(width: 70, height: 70)
                        .scaleEffect(playMode ? 2 : 1)
                        .opacity(playMode ? 0 : 1)
                )

                Spacer()
                
            }//VStack
            .padding()
            
            
            if playMode {
                Color.cyan
                    .ignoresSafeArea()
                    .transition(.opacity)
            }
            
        }//ZStack

    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
