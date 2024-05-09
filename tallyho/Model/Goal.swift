//
//  Goal.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import Foundation

/* -------     EXTENSIONS     ------- */
// Make Character Data Type conform to Codable Protocol so that Goal can conform to Codable
extension Character: Codable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let string = try container.decode(String.self)
        guard !string.isEmpty else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Decoder expected a Character but found an empty string.")
        }
        guard string.count == 1 else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Decoder expected a Character but found a string: \(string)")
        }
        self = string[string.startIndex]
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(String(self))
    }
}





/* -------     GOAL STRUCTURE     ------- */
struct Goal: Codable {
 
    /* -------     GOAL VARIABLES     ------- */
    var name: String
    var description: String
    var tallys: Int
    var icon: Character
    var multiplier: Int
    
    
    
    
    
    /* -------     INITIALIZER     ------- */
    init(name: String, description: String, tallys: Int, icon: Character, multiplier: Int) {
        self.name = name
        self.description = description
        self.tallys = tallys
        self.icon = icon
        self.multiplier = multiplier
    }
    
    
    
    
    /* -------     FUNCTIONS     ------- */
    // Adds to tallys by multiplier
    mutating func addition() {
        self.tallys += self.multiplier
    }
    
    // Subtracts from tallys by multiplier
    mutating func subtraction() {
        self.tallys -= self.multiplier
    }
    
    
    
    
    
    /* -------     SAMPLE DATA     ------- */
    static var newGoalSection = Section(name: "Goals!", goals: [
        Goal(name: "New Goal", description: "From the goals list, create a new goal!", tallys: 10, icon: "⭐️", multiplier: 1),
        Goal(name: "Edit Goal", description: "From the goals list, click on the goal, and click the edit button. You can edit things like the name, description, icon, tallys, section, or multiplier.", tallys: 1, icon: "🎨", multiplier: 25),
        Goal(name: "Count Goal", description: "By clicking on the up and down arrows you can increase or decrease the total tallys on the goal.", tallys: 10000, icon: "🧮", multiplier: 1)
    ])
    static var arrangeGoalsSection = Section(name: "Arrange/Delete Goals", goals: [
        Goal(name: "Arrange Goals", description: "From the goals list, you can click the edit button and arrange the goals in whichever order or change sections", tallys: 13, icon: "↩️", multiplier: 13),
        Goal(name: "Delete Goal", description: "From the goals list, you can click the edit button and then select the red circle to the left of the goal you wish to delete and then click delete", tallys: -300, icon: "✂️", multiplier: 9)
    ])
    static var sectionsSection = Section(name: "Section", goals: [
        Goal(name: "New Section", description: "From either the add goal screen or the edit existing goal screen, click on the Select a Section box and click the + sign.", tallys: 11323, icon: "🥳", multiplier: 1),
        Goal(name: "Arrange/Delete Sections", description: "From either the add goal screen or the edit existing goal screen, click on the Select a Section box and click the Edit button to rearrange the sections or delete them.", tallys: 1990, icon: "🫧", multiplier: 1986),
    ])
    static var exampleSection = Section(name: "Examples", goals: [
        Goal(name: "Daily Vegetables", description: "Eat 5 servings of fruits and vegetables a day this year!", tallys: 560, icon: "🥦", multiplier: 5),
        Goal(name: "Mediation Minutes", description: "Start mediating more! Just a couple minutes before bed", tallys: 173, icon: "🧘🏿‍♀️", multiplier: 1),
        Goal(name: "Go to bed ontime", description: "Get to bed by 11pm every night, including weekends", tallys: 3, icon: "😴", multiplier: 1),
        Goal(name: "Cook Dinner", description: "Cook dinner at home instead of getting take out and delivery", tallys: 102, icon: "👩🏻‍🍳", multiplier: 1),
        Goal(name: "DND - Character Health", description: "My Character's current health", tallys: 41, icon: "🧙🏽‍♀️", multiplier: 1),
        Goal(name: "Essay Revisions", description: "I want to do at least 5 revisions to my essay, but not more than 10.", tallys: 9, icon: "📝", multiplier: 1),
        Goal(name: "Days with a cough", description: "How many days I've had my cough", tallys: 3, icon: "🦠", multiplier: 1)
        
        
        
    
    ])

}
