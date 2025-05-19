//
//  ContentView.swift
//  VideoComponent
//
//  Created by Daniel T. Do on 3/22/25.
//

import SwiftUI 

struct DisplayView: View {
    @State var currStep: Int = 0

    // Will get the ID from the main page so that the data can be put here
    @Binding var data: ResultItem
    
    @Environment(\.presentationMode) var presentationMode
    
    
    // Function needs to be implemented here to get the data according to the ID
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    Header(onBack: {
                        presentationMode.wrappedValue.dismiss()
                    }, type: "in")
                    
                    // Top Heading
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 0.75, green: 0.05, blue: 0.15))
                        .frame(width: geo.size.width * 0.7, height: 100)
                        .overlay(
                            Text(data.skillTitle)
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                        )
                    
                    
                    
                    // Step Box
                    VStack(spacing: 20) {
                        if (data.skillType == "Recipes" || data.skillType == "Text") {
                            RecipeComponent(data: .constant(data), stepNumber: $currStep)
                        } else {
                            VideoComponent(data: .constant(data), currStep: $currStep)
                        }
                    }
                    .padding()
                    .frame(width: geo.size.width * 0.8)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(red: 0.75, green: 0.05, blue: 0.15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 4)
                            )
                    )
                    .padding(.horizontal, 80)
                    
                    
                    
                    // Arrow Button Bottom Right
                    HStack {
                        ButtonComp(currStep: $currStep, maxStep: .constant(data.steps?.count ?? 0), symbol: .constant("arrowshape.backward.fill"), job: .constant("subtract"), theOpacity: .constant(currStep == 0 ? 0.0 : 1.0))
                        Spacer()
                        ButtonComp(currStep: $currStep, maxStep: .constant(data.steps?.count ?? 0), symbol: .constant("arrowshape.forward.fill"), job: .constant("add"), theOpacity: .constant(currStep ==  (data.steps?.count ?? 0) - 1 ? 0.0 : 1.0))
                    }
                    .frame(width: geo.size.width * 0.85)
                    .padding(30)
                }
            }
        }
    }
}
