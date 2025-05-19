import SwiftUI

struct SearchPage: View {
    @Binding var skillType: String
    @State private var searchText = ""
    @State private var selectedFilter: String = "All"
    @Environment(\.presentationMode) var presentationMode
    
    let allResults: [ResultItem] = [
        ResultItem(skillDescription: "Learn the basics of making pasta", skillType: "Recipes", skillCategory: "hard", skillTitle: "Making Pasta | The Basics", videoLink: "", steps: [
                Step(text: "Get a pot"),
                Step(text: "Add water to the pot"),
                Step(text: "Wait for that water to boil"),
                Step(text: "Add the noodles"),
                Step(text: "Wait for the noodles to cook"),
                Step(text: "Congrats! You're done.")
        ]),
        ResultItem(skillDescription: "Test Recipe", skillType: "Recipes", skillCategory: "hard", skillTitle: "Making Coffee", videoLink: "", steps: [
                Step(text: "Boil water"),
                Step(text: "Add coffee"),
                Step(text: "After a minute or two, you have coffee!")
        ]),
        ResultItem(skillDescription: "Learn how to make a cake", skillType: "Videos", skillCategory: "hard", skillTitle: "Making a Cake", videoLink: "https://www.youtube.com/watch?v=qtlhdIfojmc&pp=ygUJI2Nha2VfYW5k", steps: [
                Step(text: "Whats the video talking about?", answers: ["Making a cake", "Option B", "Option C", "Option D"], correctAnswer: "Making a cake")
        ]),
        ResultItem(skillDescription: "Quick way to clean up", skillType: "Text", skillCategory: "soft", skillTitle: "Cleaning Up", videoLink: "", steps: [
                Step(text: "Clean the counters"),
                Step(text: "Make sure the chairs are put up"),
                Step(text: "Take out the trash"),
                Step(text: "Turn off the lights and lock up")
        ]),
        ResultItem(skillDescription: "Quickly set up before the store opens", skillType: "Text", skillCategory: "soft", skillTitle: "Setting Up", videoLink: "", steps: [
                Step(text: "Unlock and turn on the lights"),
                Step(text: "Put the table chairs down"),
                Step(text: "Set up the counter"),
                Step(text: "Change the sign from closed to open")
        ])
    ]

    var filteredResults: [ResultItem] {
        allResults.filter { item in
            (selectedFilter == item.skillType || selectedFilter == "All") && (item.skillCategory == skillType) &&
            (searchText.isEmpty || item.skillTitle.lowercased().contains(searchText.lowercased()))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Top bar
                Header(onBack: {
                    presentationMode.wrappedValue.dismiss()
                }, type: "out", name: ("BrewEd | " + skillType.prefix(1).uppercased() + skillType.dropFirst() + " Skills"))
                
                // Search bar & filters
                VStack(alignment: .leading, spacing: 24) {
                    TextField("Recipes, Directions, etc.", text: $searchText)
                        .padding()
                        .background(Color.black.opacity(0.1).cornerRadius(8))
                    HStack(alignment: .top, spacing: 12) {
                        ForEach(["All", "Text", "Videos", "Recipes"], id: \.self) { filter in
                            Button(action: {
                                selectedFilter = filter
                            }) {
                                Text(filter)
                                    .font(.system(size: 18, weight: .semibold))
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 8)
                                    .background(selectedFilter == filter ?
                                                Color.black.opacity(0.1) : Color(red: 0.75, green: 0.05, blue: 0.15))
                                    .foregroundColor(selectedFilter == filter ? .black : .white)
                                    .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
                
                // Results
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 3) {
                        if (selectedFilter == "All") {
                            Text("Results (\(filteredResults.count))")
                                .font(.title3)
                                .bold()
                                .padding(.horizontal)
                        } else {
                            Text("Results (\(filteredResults.filter {$0.skillType == selectedFilter}.count))")
                                .font(.title3)
                                .bold()
                                .padding(.horizontal)
                        }
                        if (searchText != "") {
                            Text("Looked for \"\(searchText)\"")
                                .font(.subheadline)
                                .padding(.horizontal)
                                .opacity(0.3)
                        }
                    }
                    List(filteredResults) { item in
                        SearchPageCard(data: .constant(item))
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                }
                
                Spacer()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}
