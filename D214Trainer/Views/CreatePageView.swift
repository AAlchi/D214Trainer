import SwiftUI

struct CreatePageView: View {
    @State private var videoURL: String = ""
    @State private var typeOfItem = "Recipes"
    @State private var listItems: [ResultItem] = []
    @State var allSteps: [Step] = []
    @State private var newStep = ""
    @State private var title = ""
    @State private var description = ""
    @State var softOrHardSkill = "soft"
    
    @State var answerChoicesTemp = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                ScrollView {
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
                                        Text("Recipes")
                                            .font(.subheadline)
                                            .multilineTextAlignment(.center)
                                    }
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.red)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        typeOfItem = "Recipes"
                                    }
                                    .opacity(typeOfItem != "Recipes" ? 0.6 : 1.0)
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
                                    .onTapGesture {
                                        typeOfItem = "Text"
                                    }
                                    .opacity(typeOfItem != "Text" ? 0.6 : 1.0)
                                    
                                    
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
                                    .onTapGesture {
                                        typeOfItem = "Videos"
                                    }
                                    .opacity(typeOfItem != "Videos" ? 0.6 : 1.0)
                                    
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Toggle("Soft Skill", isOn: .constant(softOrHardSkill == "soft"))
                                    .onTapGesture {
                                        softOrHardSkill = "soft"
                                    }
                                Toggle("Hard Skill", isOn: .constant(softOrHardSkill == "hard"))
                                    .onTapGesture {
                                        softOrHardSkill = "hard"
                                    }
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Skill Title")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                TextField("", text: $videoURL)
                                    .padding(10)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                    )
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Skill Description")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                TextField("", text: $videoURL)
                                    .padding(10)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                    )
                            }
                            
                            if (typeOfItem == "Recipes" || typeOfItem == "Text") {
                                
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Text("Add a Step")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Button("Add") {
                                            allSteps.append(Step(text: newStep))
                                        }
                                    }
                                    
                                    TextField("", text: $newStep)
                                        .padding(10)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                        )
                                }
                                
                                List(allSteps) { item in
                                    Text(item.text)
                                }
                            }
                            
                            if (typeOfItem == "Videos") {
                                Text("Comming Soon")
                            }
                            
                            Button {
                                listItems.append(ResultItem(skillDescription: description, skillType: typeOfItem, skillCategory: softOrHardSkill, skillTitle: title, videoLink: "", steps: allSteps))
                            } label: {
                                Text("Create (Comming Soon)")
                                    .padding()
                                    .background(.red)
                                    .foregroundStyle(.white)
                                    .bold()
                                    .cornerRadius(5.0)
                            }
                            
                            Spacer(minLength: 20)
                        }
                        .padding()
                        .frame(maxWidth: 600)
                    }
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

