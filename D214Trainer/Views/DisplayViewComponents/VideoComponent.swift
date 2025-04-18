//
//  ContentView.swift
//  VideoComponent
//
//  Created by Daniel T. Do on 3/22/25.
//

import SwiftUI
import WebKit

struct VideoComponentView: View {
var body: some View {
            ZStack {
                // Full screen red background
                Color(red: 0.75, green: 0.05, blue: 0.15)
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                   
                    VStack(spacing: 20) {
                        Text("Step 1:")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("Watch this video")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        VideoView(videoID: "iJLgi3sPf4Q")
                            .frame(width: 450, height: 250)
                            .cornerRadius(15)
                            .padding()
                    }

                    Spacer()
                    
                   
                    HStack {
                        Spacer()
                        Button(action: {
                          
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
                    .padding()
                }
                .padding()
            }
        }
    }

struct VideoComponentView_Previews: PreviewProvider {
static var previews: some View {
    VideoComponentView()
}
}
