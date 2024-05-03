//
//  Goal.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import Foundation

struct Goal {
    var name: String
    var description: String
    var tallys: Int
    var icon: Character
    var multiplier: Int
    
    
    
    // SAMPLE DATA
    static var workSection = Section(name: "Work", goals: [
        Goal(name: "Contracts in 2024", description: "How many Contracts we've gotten in 2024", tallys: 4, icon: "💼", multiplier: 1),
        Goal(name: "Lunches with Clients", description: "How many times we've gone out for lunches with clients in 2024", tallys: 32, icon: "🍲", multiplier: 1)
    ])
    static var homeSection = Section(name: "Home", goals: [
        Goal(name: "Perfect Nights Sleep", description: "Days with perfect nights sleep", tallys: 0, icon: "😴", multiplier: 1),
        Goal(name: "Cook Dinner", description: "Cooked dinner instead of going out", tallys: 42, icon: "👩‍🍳", multiplier: 1),
        Goal(name: "Play with Dog", description: "Times played with dog!", tallys: 96, icon: "J", multiplier: 1)
    ])
    static var selfCareSection = Section(name: "Self-Care", goals: [
        Goal(name: "Meditation Minutes", description: "Minutes Meditating in 2024", tallys: 1_230, icon: "🧘‍♀️", multiplier: 10),
        Goal(name: "Daily Vegetables", description: "Days where I ate at least 5 servings of fruits or vegetables a day", tallys: 450, icon: "🥦", multiplier: 5),
        Goal(name: "Video Game Hours", description: "Hours I've played video games in 2024", tallys: 42, icon: "🎮", multiplier: 1),
        Goal(name: "Date Nights", description: "Date nights with hubby!", tallys: 12, icon: "💕", multiplier: 1)
    ])
    static var communitySection = Section(name: "Community", goals: [
        Goal(name: "Participants", description: "How many participents in the Community activity", tallys: 153, icon: "P", multiplier: 1)
    ])
}
