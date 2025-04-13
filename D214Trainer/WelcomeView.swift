//
//  ContentView.swift
//  D214Trainer
//
//  Created by Ali Alchikh Ibrahim on 3/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color(red: 196/255, green: 48/255, blue: 18/255)
            .ignoresSafeArea()
            .overlay {
                
                VStack(alignment: .leading) {
                    
                    Text("Good morning!").foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size:60))
                        .bold()
                        .padding()
                        .position(x: 210, y: 200)
                        
                    
                    
                    Text("SELECT YOUR TASK").foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size:32))
                        .bold()
                        .position(x: 195, y:100)
                    
              
                    
                    Button(action: {
                        print("Clicked")
                            
                        
                    }) {
                        Text("   Soft Skills          ").foregroundColor(Color(red: 196/255, green: 48/255, blue: 18/255))
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .border(.black)
                            .background(Color.white)
                            .background().frame(width: 450, height: 75)
                            .fontWeight(.bold)
                            .padding(10)
                            .position(x: 200, y: 175)
                            
                        
                        
                        
                        
                        }
                    .frame(width:1200, height: 450, alignment: .trailing)
                }
                
                
                
                VStack(alignment: .leading) {
                    Button(action: {
                        print("Clicked Again")
                        
                    }) {
                        Text("   Hard Skills         ").foregroundColor(Color(red: 196/255, green: 48/255, blue: 18/255))
                            .background(Color.white)
                            .border(.black)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(10)
                            .position(x: 200, y: 250)
                            
                        
                        
                    }
                }
                .frame(width:1200, height: 500, alignment: .trailing)
            }
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
