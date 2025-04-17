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
            
            HStack {
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
                    .position(x: -390, y:275)
                
                
                
                
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
                        .position(x: 200, y: 250)
                    
                    
                    
                    
                    
                    
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
        
        
        
    }
    

