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
        guard let url = URL(string: videoID) else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}
struct VideoComponent: View {
    @Binding var data: ResultItem
    @Binding var currStep: Int
    @State var toggleString = ""
    var body: some View {
        ZStack {
            // Fullscreen red background
            Color(red: 0.75, green: 0.05, blue: 0.15)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Watch this Video")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()

                        if (currStep > 0) {
                            Text("\(data.steps?[currStep].text ?? "")")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.white)
                        }
                    }
                    Spacer()

                    if (currStep == 0) {
                        VideoView(videoID: (data.videoLink != nil ? data.videoLink : "") ?? "")
                            .frame(width: 450, height: 250)
                            .cornerRadius(15)
                            .padding()
                    } else {
                        if let answers = data.steps?[currStep].answers {
                            VStack {
                                ForEach(answers, id: \.self) { answer in
                                    Toggle(answer, isOn: .constant(answer == toggleString))
                                        .frame(maxWidth: 300)
                                        .foregroundStyle(.black)
                                        .bold()
                                        .padding()
                                        .background(.white)
                                        .cornerRadius(5.0)
                                        .onTapGesture {
                                            toggleString = answer
                                        }
                                }
                                
                                if (toggleString != "") {
                                    if (toggleString == data.steps?[currStep].correctAnswer ?? "") {
                                        Text("Correct!")
                                            .padding(.top, 5)
                                            .foregroundStyle(.white)
                                    } else {
                                        Text("Sorry, that's not right!")
                                            .padding(.top, 5)
                                            .foregroundStyle(.white)
                                    }
                                }
                                
                            }
                        }
                    }
                    Spacer()

                }
            }
            .padding()
        }
    }
}
