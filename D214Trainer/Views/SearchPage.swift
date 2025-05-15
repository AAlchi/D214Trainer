import SwiftUI

struct SearchPage: View {
    @Binding var skillType: String
    @State private var searchText = ""
    @State private var selectedFilter: String = "All"
    @Environment(\.presentationMode) var presentationMode

    struct ResultItem: Identifiable {
        let id = UUID()
        let title: String
        let description: String
        let type: String
        let skillType: String
    }
    
    let allResults: [ResultItem] = [
        .init(title: "How to make a Cappuccino", description: "Learn how to make a Cappuccino from scratch!", type: "Recipes", skillType: "hard"),
        .init(title: "Benefits of Black Coffee", description: "A deep dive into health benefits.", type: "Text", skillType: "hard"),
        .init(title: "Espresso Basics", description: "A video tutorial on espresso shots.", type: "Videos", skillType: "soft"),
        .init(title: "Latte Art Guide", description: "Master the art of milk and foam.", type: "Text", skillType: "hard"),
        .init(title: "Mocha Recipe", description: "Chocolate and coffee together, yes please.", type: "Recipes", skillType: "soft"),
        .init(title: "Brewing Techniques", description: "Video on pour-over vs French press.", type: "Videos", skillType: "hard")
    ]
    
    var filteredResults: [ResultItem] {
        allResults.filter { item in
            (selectedFilter == item.type || selectedFilter == "All") &&
            (searchText.isEmpty || item.title.lowercased().contains(searchText.lowercased()))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Top bar
                Header(onBack: {
                    presentationMode.wrappedValue.dismiss()
                }, type: "out")
                
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
                        Text("Results (\(filteredResults.filter {$0.skillType == skillType}.count))")
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                        if (searchText != "") {
                            Text("Looked for \"\(searchText)\"")
                                .font(.subheadline)
                                .padding(.horizontal)
                                .opacity(0.3)
                        }
                    }
                    List(filteredResults) { item in
                        if (item.skillType == skillType) {
                            SearchPageCard(cardTitle: .constant(item.title), cardType: .constant(item.type), cardDescription: .constant(item.description))
                                .listRowSeparator(.hidden)
                        }
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
