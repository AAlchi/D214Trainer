//
//  ContentView.swift
//  VideoComponent
//
//  Created by Daniel T. Do on 3/22/25.
//

import SwiftUI
import WebKit

struct YoutubePlayerView: UIViewRepresentable {
    
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
struct VideoComponent: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                Spacer()
                // Top Heading
                Text("Cleaning the Espresso Machine")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(red: 0.75, green: 0.05, blue: 0.15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 4)
                            )
                    )
                    .padding(.horizontal, 150)
                
              
                   
                // Step Box
                VStack(spacing: 20) {
                    Text("Step 1:")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Watch this video")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    YoutubePlayerView(videoID: "iJLgi3sPf4Q")
                        .frame(height:250)
                        .frame(width: 450)
                        .cornerRadius(15)
                        .padding()
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
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
                    Spacer()
                        .frame(width: 800.0)
                    Button(action: {
                        // Add your action here
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
                .padding(30)
            }
        }
    }
}

struct VideoComponent_Previews: PreviewProvider {
    static var previews: some View {
        VideoComponent()
    }
}
