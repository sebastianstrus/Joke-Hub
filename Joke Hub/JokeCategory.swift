//
//  JokeCategory.swift
//  Joke Hub
//
//  Created by Sebastian Strus on 3/12/26.
//

import SwiftUI

enum JokeCategory: String, CaseIterable {
    case all = "All"
    case favorites = "Favorites"
    case tech = "Tech"
    case dad = "Dad"
    case puns = "Puns"
    case science = "Science"
    case animals = "Animals"
    case food = "Food"
    case sports = "Sports"
    case music = "Music"
    case history = "History"
    case dark = "Dark"
    case sex = "Sex"

    var emoji: String {
        switch self {
        case .all:       return "🎭"
        case .favorites: return "❤️"
        case .tech:      return "🧑‍💻"
        case .dad:       return "👨"
        case .puns:      return "🎯"
        case .science:   return "🔬"
        case .animals:   return "🐾"
        case .food:      return "🍕"
        case .sports:    return "⚽"
        case .music:     return "🎵"
        case .history:   return "📜"
        case .dark:      return "🌑"
        case .sex:      return "💋"
        }
    }

    var color: Color {
        switch self {
        case .all:       return .purple
        case .favorites: return .indigo
        case .tech:      return .blue
        case .dad:       return .orange
        case .puns:      return .green
        case .science:   return .cyan
        case .animals:   return .brown
        case .food:      return .red
        case .sports:    return .green
        case .music:     return .pink
        case .history:   return .indigo
        case .dark:      return .gray
        case .sex:       return .red
        }
    }
}
