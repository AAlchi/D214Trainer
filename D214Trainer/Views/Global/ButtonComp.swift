//
//  ButtonComponent.swift
//  D214Trainer
//
//  Created by Ali AI on 5/18/25.
//

import Foundation
import SwiftUI

struct ButtonComp: View {
    @Binding var currStep: Int
    @Binding var maxStep: Int
    @Binding var symbol: String
    @Binding var job: String
    @Binding var theOpacity: Double
    
    var body: some View {
        Button(action: {
            if (job == "add" && currStep < maxStep - 1) {
                currStep += 1
            }
            
            if (job == "subtract" && currStep > 0) {
                currStep -= 1
            }
        
        }) {
            Image(systemName: symbol)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 25)
                .foregroundColor(.white)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(red: 0.75, green: 0.05, blue: 0.15))
                )
        }
        .opacity(theOpacity)
    }
}

