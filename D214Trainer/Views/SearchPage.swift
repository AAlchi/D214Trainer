import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedFilter: String = "Recipes"

    struct ResultItem: Identifiable {
        let id = UUID()
        let title: String
        let description: String
        let type: String
    }

    let allResults: [ResultItem] = [
        .init(title: "How to make a Cappuccino", description: "Learn how to make a Cappuccino from scratch!", type: "Recipes"),
        .init(title: "Benefits of Black Coffee", description: "A deep dive into health benefits.", type: "Text"),
        .init(title: "Espresso Basics", description: "A video tutorial on espresso shots.", type: "Videos"),
        .init(title: "Latte Art Guide", description: "Master the art of milk and foam.", type: "Text"),
        .init(title: "Mocha Recipe", description: "Chocolate and coffee together, yes please.", type: "Recipes"),
        .init(title: "Brewing Techniques", description: "Video on pour-over vs French press.", type: "Videos")
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
                HStack {
                    Button(action: {
                        // Back action
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }

                    Text("D214 Trainer")
                        .font(.title2).bold()
                        .foregroundColor(.white)

                    Spacer()

                    Button(action: {
                        // Main screen
                    }) {
                        Text("Main Screen")
                            .foregroundColor(.white)
                            .bold()
                    }

                    Button(action: {
                        // Create action
                    }) {
                        Text("Create")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color(red: 0.75, green: 0.05, blue: 0.15))

                // Search bar & filters
                VStack(spacing: 24) {
                    TextField("Search", text: $searchText)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0.75, green: 0.05, blue: 0.15))
                        .cornerRadius(8)
                        .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(["Text", "Videos", "Recipes"], id: \.self) { filter in
                            Button(action: {
                                selectedFilter = filter
                            }) {
                                Text(filter)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 12)
                                    .background(selectedFilter == filter ?
                                                Color.white : Color(red: 0.75, green: 0.05, blue: 0.15))
                                    .foregroundColor(selectedFilter == filter ? .black : .white)
                                    .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)

                // Results
                VStack(alignment: .leading, spacing: 16) {
                    Text("Results")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)

                    ForEach(filteredResults) { item in
                        Button(action: {
                            // Future action when tapped
                        }) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        Text(item.title)
                                            .font(.headline)

                                        Text(item.type)
                                            .font(.caption)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color(red: 0.75, green: 0.05, blue: 0.15))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }

                                    Text(item.description)
                                        .font(.subheadline)
                                }

                                Spacer()

                                Image(systemName: iconName(for: item.type))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }

                Spacer()
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func iconName(for type: String) -> String {
        switch type {
        case "Videos":
            return "play.rectangle.fill"
        case "Text":
            return "doc.text.fill"
        case "Recipes":
            return "cup.and.saucer.fill"
        default:
            return "questionmark.square.fill"
        }
    }
}

#Preview {
    ContentView()
}
