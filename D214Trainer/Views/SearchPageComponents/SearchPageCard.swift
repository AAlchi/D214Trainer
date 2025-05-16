//
//  SearchPageCard.swift
//  D214Trainer
//
//  Created by Ali Alchikh Ibrahim on 5/15/25.
//

import Foundation
import SwiftUI

struct SearchPageCard: View {
    @Binding var data: ResultItem
    
    var body: some View {
        NavigationLink(destination: DisplayView(data: .constant(data))) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(data.skillTitle)
                            .font(.headline)
                        
                        Text(data.skillType)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(red: 0.75, green: 0.05, blue: 0.15))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Text(data.skillDescription)
                        .font(.subheadline)
                }
                
                Spacer()
                
                Image(systemName: iconName(for: data.skillType))
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
//    SearchPageCard()
}
