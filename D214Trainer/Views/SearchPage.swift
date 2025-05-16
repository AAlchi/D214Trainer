import SwiftUI

struct SearchPage: View {
    @Binding var skillType: String
    @State private var searchText = ""
    @State private var selectedFilter: String = "All"
    @Environment(\.presentationMode) var presentationMode
    
    let allResults: [ResultItem] = [
    ]

    
    var filteredResults: [ResultItem] {
        allResults.filter { item in
            (selectedFilter == item.skillType || selectedFilter == "All") &&
            (searchText.isEmpty || item.skillTitle.lowercased().contains(searchText.lowercased()))
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
