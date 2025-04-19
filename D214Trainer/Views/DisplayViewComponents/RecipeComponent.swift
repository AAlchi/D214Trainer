import SwiftUI

struct RecipeComponent: View {
    var body: some View {
        ZStack {
            // Fullscreen red background
            Color(red: 0.75, green: 0.05, blue: 0.15)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer() // This moves content downward slightly

                // Ingredients Title
                Text("Ingredients")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)

                // Ingredients List
                VStack(spacing: 20) {
                    Text("1 shot of Espresso")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                    Text("150 ml semi skimmed milk")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }

                Spacer()

                // Bottom Right Arrow Button
                HStack {
                    Spacer()
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
                .padding()
            }
            .padding()
        }
    }
}

struct RecipeComponent_Previews: PreviewProvider {
    static var previews: some View {
        RecipeComponent()
    }
}

