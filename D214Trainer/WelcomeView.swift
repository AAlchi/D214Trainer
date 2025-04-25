//
//  ContentView.swift
//  D214Trainer
//
//  Created by Ali Alchikh Ibrahim on 3/20/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                HStack {
                    Spacer()
                    Image("img2")
                        .resizable()
                        .frame(maxHeight: .infinity)
                        .aspectRatio(contentMode: .fit)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Good morning!")
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 61))
                            
                            
                            Text("SELECT YOUR TASK")
                                .padding(.bottom)
                                .foregroundColor(.white)
                                .font(.system(size:32))
                        }
                        Button(action: {
                            print("Clicked Again")
                            
                        }) {
                            Text("Hard Skills")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(Color(red: 194/255, green: 23/255, blue: 58/255))
                                .background(Color(.white))
                                .bold()
                                .font(.system(size:30))
                            
                        }
                        .cornerRadius(10)
                        
                        
                        Button(action: {
                            print("click")
                        }) {
                            Text("Soft Skills")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(Color(red: 194/255, green: 23/255, blue: 58/255))
                                .background(Color(.white))
                                .bold()
                                .font(.system(size:30))
                        }
                        .cornerRadius(10)
                        
                    }
                    .frame(width: geo.size.width * 0.4)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 194/255, green: 23/255, blue: 58/255))
            .ignoresSafeArea()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView()
        }
    }
}



