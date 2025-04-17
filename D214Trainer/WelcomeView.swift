//
//  ContentView.swift
//  D214Trainer
//
//  Created by Ali Alchikh Ibrahim on 3/20/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        
        
        
        ZStack {
            Color(red: 194/255, green: 23/255, blue: 58/255)
                .ignoresSafeArea()
            Image("img")
                .position(x:960 , y:400)
            
            VStack {
                Spacer()
                
                Text("Good morning!").foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size:61))
                    .bold()
                    .padding()
                    .position(x: 210, y: 200)
                
                
                
                Text("SELECT YOUR TASK").foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size:32))
                    .bold()
                    .position(x: 210, y:-100)
                
                
                
                
            }
            
            
            VStack(alignment: .leading) {
                Button(action: {
                    print("Clicked Again")
                    
                    
                }) {
                    Text("   Hard Skills         ").foregroundColor(Color(red: 194/255, green: 23/255, blue: 58/255))
                        .background(Color.white)
                        .border(.black)
                        .cornerRadius(11)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(10)
                        .position(x: 200, y: 400)
                    
                    
                    
                    
                    
                    
                }
                VStack(alignment: .leading) {
                    
                    Button(action: {
                        print("click")
                        
                    }) {
                        Text("   Soft Skills         ").foregroundColor(Color(red: 194/255, green: 23/255, blue: 58/255))
                            .background(Color.white)
                            .border(.black)
                            .cornerRadius(11)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(10)
                            .position(x: 200, y: 50)
                    }
                    
                    .frame(width:300, height: 300, alignment: .trailing)
                }
                
                
                
                
                
            }
            
            
        }
    }
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                WelcomeView()
                
                
                
            }
        }
        
        
        
    }
    
    

