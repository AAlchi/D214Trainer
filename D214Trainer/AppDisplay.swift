//
//  ContentView.swift
//  D214Trainer
//
//  Created by Logan Hammond on 3/31/25.
//


//
//  ContentView.swift
//  appDisplay
//
//  Created by Logan Hammond on 2/25/25.
//

import SwiftUI

struct DisplayView: View {
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                    }
                    
                    Text("D214 Trainer")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                       
                    Spacer()
                    
                    Text("Recipe | Make a Cappuccino")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                        .padding(.top, 30)
                }
                .padding()
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .padding()
                    
                    VStack {
                        HStack {
                            Text("Cappuccino")
                                .font(.largeTitle)
                                .font(.title2)
                                .bold()
                                .padding()
                                .frame(width: 900, height: 100)
                                .border(Color.black, width: 7)               .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                            
                            Image("cup")
                                .resizable()
                                .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding()
                        }
                        .padding(.horizontal)
                        
                        VStack {
                            
                            Text("Ingredients")
                                .font(.headline)
                                
                                .padding(.top)
                                .font(.largeTitle)
                            Text("1 shot of Espresso")
                                .padding(.top, 2)
                                .font(.largeTitle)
                            Text("150 ml semi skimmed milk")
                                .padding(.bottom)
                                .font(.largeTitle)
                        }
                        .frame(width: 1000, height: 600)
                        .border(Color.black, width: 7)
                        
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            Button(action: {
                            }) {
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 100, height: 30)
                                    .border(Color.black, width: 2)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                                    .padding(.bottom)

                            }
                            .padding(.trailing, 100)
                            .padding()
                        }
                    }
                }
                HStack {
                    Spacer()
                    Text("Soft Skill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.trailing)
                }
            }
        }
    }
}

struct DisplayPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
