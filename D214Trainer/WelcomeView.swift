//
//  ContentView.swift
//  D214Trainer
//
//  Created by Ali Alchikh Ibrahim on 3/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
            .overlay {
                VStack(alignment: .leading) {
                    Text("Good morning!").foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.largeTitle.weight(.bold))
                        .padding()
                    
                    Text("SELECT YOUR TASK").foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size:30))
                    
                }
                
                VStack(alignment: .leading) {
                    Button(action: {
                        print("Clicked")
                    }) {
                        Text("Soft Skills").foregroundColor(.red)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .border(.black)
                            .background(Color.white)
                            .fontWeight(.bold)
                            .padding(10)
                            .position(x: 150, y: 300)
                        
                        }
                    .frame(width:300, height: 300, alignment: .trailing)
                }
                
                
                VStack {
                    Button(action: {
                        print("Clicked")
                    }) {
                        Text("Hard Skills").foregroundColor(.red)
                            .background(Color.white)
                            .border(.black)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(10)
                            .position(x: 150, y: 250)
                    }
                }
                .frame(width:300, height: 300, alignment: .trailing)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
