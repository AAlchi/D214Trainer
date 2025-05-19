import SwiftUI

struct RecipeComponent: View {
    @Binding var data: ResultItem
    @Binding var stepNumber: Int
    
    var body: some View {
        ZStack {
            // Fullscreen red background
            Color(red: 0.75, green: 0.05, blue: 0.15)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer() // This moves content downward slightly
                HStack {
                    Spacer()
                    Text("\(data.steps?[stepNumber].text ?? "")")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    Spacer()
                    Image("BrewEd")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5.0)
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}

