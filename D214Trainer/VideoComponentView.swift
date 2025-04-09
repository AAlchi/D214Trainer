//
//  ContentView.swift
//  videoComponent
//
//  Created by Logan Hammond on 4/6/25.
//

import SwiftUI

struct VideoComponentView: View {
var body: some View {
ZStack {
Color.gray.opacity(0.1)

// Simulated Device Frame
RoundedRectangle(cornerRadius: 40)
.fill(Color.black)
.frame(width: 400, height: 750)
.overlay(
RoundedRectangle(cornerRadius: 30)
    .fill(Color.white)
    .padding(15)
    .overlay(
        VStack(spacing: 30) {
            Spacer()
            Text("Cleaning the Espresso Machine")
.font(.title2)
.fontWeight(.bold)
.foregroundColor(.white)
.padding()
.frame(maxWidth: .infinity)
.background(Color.red)
.cornerRadius(10)
VStack(spacing: 20) {
Text("Step 1:")
.font(.title)
.fontWeight(.bold)
.foregroundColor(.white)

Text("Watch this video (in fullscreen)")
.foregroundColor(.white)
.font(.body)

Image("video")
.resizable()
.aspectRatio(contentMode: .fit)
.frame(maxWidth: 300)
.cornerRadius(5)
}
.padding()
.background(Color.red)
.cornerRadius(12)
.padding(.horizontal)

            // Matching Button
            HStack {
                Spacer()
                Button(action: {}) {
                    Text("➔")
.font(.system(size: 24, weight: .bold))
.foregroundColor(.white)
.frame(width: 60, height: 40)
.background(Color.red)
.cornerRadius(10)
}
.padding(.trailing, 20)
}

    Spacer()
}
.padding()
)
)
}
.edgesIgnoringSafeArea(.all)
}
}
struct VideoComponentView_Previews: PreviewProvider {
static var previews: some View {
VideoComponentView()
}
}

