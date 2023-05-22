//
//  AddView.swift
//  HabitTracker
//
//  Created by user239371 on 5/22/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var category = "Career"
    @State private var points = 0
    let categories = ["Instrument", "Career", "Fitness", "Mental Health"]
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                    }
                }
                Stepper("Point Value: \(points)", value: $points, in: 0...100)
                }
            .navigationTitle("Add a new habit")
            .toolbar {
                Button("Save") {
                    let item = HabitItem(name: name, category: category, status: false, score: points)
                    habits.items.append(item)
                    dismiss()
                }
            } 
        }
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
