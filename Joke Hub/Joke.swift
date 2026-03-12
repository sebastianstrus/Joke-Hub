//
//  Joke.swift
//  Joke Hub
//
//  Created by Sebastian Strus on 3/12/26.
//

import Foundation

struct Joke: Identifiable {
    let id = UUID()
    let setup: String
    let punchline: String
    let category: JokeCategory
}
