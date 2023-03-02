//
//  ExpenseItem.swift
//  iExpenseV5
//
//  Created by Joe Yi on 12/10/22.
//

import Foundation


struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
