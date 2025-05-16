import SwiftUI

struct CreatePageView: View {
    @State private var videoURL: String = ""
    @State private var allowVideoRecording = false
    @State private var allowTeacherQuestions = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer(minLength: 20)
                    VStack(alignment: .leading, spacing: 25) {
                        Text("Create a Guide!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(12)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("What kind of guide are you creating?")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            HStack(spacing: 15) {
                                VStack {
                                    Image(systemName: "mug")
                                        .font(.title2)
                                    Text("Recipe")
                                        .font(.subheadline)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(10)
                                VStack {
                                    Image(systemName: "list.bullet")
                                        .font(.title2)
                                    Text("Plain Directions")
                                        .font(.subheadline)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(10)
                                
                                VStack {
                                    Image(systemName: "video")
                                        .font(.title2)
                                    Text("Video Directions")
                                        .font(.subheadline)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(10)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Create Custom Directions")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                .frame(height: 120)
                                .overlay(
                                    Text("Step section goes here...")
                                        .foregroundColor(.gray)
                                )
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Upload Video URL (YouTube only)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            TextField("Enter YouTube video URL", text: $videoURL)
                                .padding(10)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                )
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Toggle("Allow user to create a video recording", isOn: $allowVideoRecording)
                                .toggleStyle(SwitchToggleStyle(tint: .red))
                            Toggle("Allow teacher to ask user questions", isOn: $allowTeacherQuestions)
                                .toggleStyle(SwitchToggleStyle(tint: .red))
                        }
                        Spacer(minLength: 20)
                    }
                    .padding()
                    .frame(maxWidth: 600)
                }
                
                
                
                Spacer(minLength: 20)
            }
        }
    }
}


struct CreatePageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CreatePageView()
        }
    }
}

