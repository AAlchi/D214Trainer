//
//  ContentView.swift
//  VideoComponent
//
//  Created by Daniel T. Do on 3/22/25.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        return webView
    }
    
    let videoID: String //Variable to change video
    
    func updateUIView(_ uiView: WKWebView, context: Context){
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)?si=dJDFIBwrDrO55Nac") else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}

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
                            VideoComponent()
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
                        Button(action: {
                            currStep -= 1
                        }) {
                            Image(systemName: "arrowshape.backward.fill")
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
                        Spacer()
                        Button(action: {
                            currStep += 1
                        }) {
                            Image(systemName: "arrowshape.forward.fill")
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
                    }
                    .frame(width: geo.size.width * 0.85)
                    .padding(30)
                }
            }
        }
    }
}
