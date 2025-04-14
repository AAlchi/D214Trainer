import SwiftUI

struct ContentView: View {
    var body: some View {
    
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                Spacer()
                // Top Heading
                Text("How to download apps from\nSelf Service")
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
                
                Spacer()
                    .frame(height: -30.0)
                // Step Box
                VStack(spacing: 20) {
                    Text("Step 1:")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Locate the Self Service App on your Ipad.")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Image("SelfService")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
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
                                    .stroke(Color.black,
                                            lineWidth:4)
                            )
                    }
                    
                }
                .padding(30)
            }
        }
    }
}

#Preview {
    ContentView()
        
}
