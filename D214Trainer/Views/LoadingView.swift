//
//  LoadingView.swift
//  D214Trainer
//
//  Created by Amir Eskarous on 3/26/25.
//

import SwiftUI

struct LoadingView: View {
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(red: 186/255, green: 12/255, blue: 47/255)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color(red: 120/255, green: 180/255, blue: 255/255)))
                            .scaleEffect(1.5)
                            .padding()
                    }
                    Spacer()
                }
                Image("BrewEd")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            .navigationDestination(isPresented: $navigate) {
                    WelcomeView()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                    navigate = true
                }
            }
        }
    }
}
