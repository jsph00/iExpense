//
//  ExpenseSection.swift
//  iExpenseV5
//
//  Created by Joe Yi on 12/10/22.
//
//  -added accessibility for VoiceOver

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section {
            
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    Text(item.amount, format: .localCurrency)
                        .style(for: item)
                }
                .accessibilityElement()
                .accessibilityLabel("\(item.name), \(item.amount.formatted(.currency(code: "USD")))")
                .accessibilityHint(item.type)
            }
            .onDelete(perform: deleteItems)
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expenses: []) { _ in } 
    }
}
