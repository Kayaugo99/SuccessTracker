//
//  Habit.swift
//  HabitTracker
//
//  Created by user239371 on 5/22/23.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let category: String
    let status: Bool
    let score: Int
}
