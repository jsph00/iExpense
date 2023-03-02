//
//  ContentView.swift
//  iExpenseV5
//
//  Created by Joe Yi on 12/10/22.
//
//  V2
//  -Working with identifiable items
//  -Added UUID
//
//  V3
//  -Sharing an observed object with a new view
//
//  V4
//  -Making changes permanent with UserDefaults
//
//  V5
//  -Showing preferred currency instead of USD
//  -Stylized expenses
//  -Split list between personal and business

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
        
    var body: some View {
        NavigationView {
            List {
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectToDelete.insert(index)
            }
        }
        
        
        expenses.items.remove(atOffsets: offsets)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



