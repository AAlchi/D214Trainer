//
//  Header.swift
//  D214Trainer
//
//  Created by Ali Alchikh Ibrahim on 5/15/25.
//

import Foundation
import SwiftUI

struct Header: View {
    var onBack: () -> Void
    var type: String
    
    @State var showAlert = false

    var body: some View {
        HStack {
            if (type == "out") {
                Button(action: {
                    onBack()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Text("BrewEd")
                    .font(.title2).bold()
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            if (type == "in") {
                Button {
                    showAlert = true
                } label: {
                    Text("Exit")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                .cornerRadius(10)
            }
            
            if (type == "out") {
                NavigationLink(destination: CreatePageView()) {
                    Text("Create")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                .cornerRadius(10)
            }
            
        }
        .padding()
        .background(Color(red: 0.75, green: 0.05, blue: 0.15))
        .alert("Are you sure you want to exit?", isPresented: $showAlert) {
            Button("Yes", role: .destructive) {
                onBack()
            }
            Button("No", role: .cancel) {}
        }
        .navigationBarBackButtonHidden(true)
    }
}


