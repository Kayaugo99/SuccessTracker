//
//  ContentView.swift
//  HabitTracker
//
//  Created by user239371 on 5/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showingAddHabit = false
    @State private var scoreIsShowing = false
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.category)
                        }
                        Spacer()
                        
                        Text("\(item.score) points")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Successful Day")
            .toolbar {
                Button {
                    showingAddHabit = true
                    scoreIsShowing = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddView(habits: habits)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
