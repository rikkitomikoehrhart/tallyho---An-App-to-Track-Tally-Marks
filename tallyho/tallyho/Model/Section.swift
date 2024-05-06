//
//  Section.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import Foundation


struct Section: Codable {
    /* -------     SECTION VARIABLES     ------- */
    var name: String
    var goals: [Goal]
    
    
    
    
    /* -------     STATIC VARIABLES     ------- */
    static var sections: [Section] = []
    
    
    
    
    
    /* -------     INITIALIZER     ------ */
    init(name: String, goals: [Goal]) {
        self.name = name
        self.goals = goals
    }
    
    
    
    
    
    /* -------     PROTOCOLS     ------- */
    private enum CodingKeys: String, CodingKey {
        case name
        case goals
    }
    
    
    
    /* -------     SAVING/ACCESSING THE DATA     ------- */
    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentDirectory.appendingPathComponent("tallyhoGoals").appendingPathExtension("plist")
    
    
    static func saveToFile(sections: [Section]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedSections = try?propertyListEncoder.encode(sections)
        
        try? codedSections?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Section]? {
        let propertyListDecoder = PropertyListDecoder()
        if let codedSections = try? Data(contentsOf: archiveURL), let decodedSections = try? propertyListDecoder.decode(Array<Section>.self, from: codedSections) {
            return decodedSections
        } else {
            return nil
        }
    }
    
   
    
    static func populateSections() {
        // Load Data
        if let savedSections = Section.loadFromFile() {
            self.sections = savedSections
        } else {
            self.sections = Section.sampleSections()
        }
    }
    
    static func saveSections() {
        Section.saveToFile(sections: self.sections)
    }
    
    
    
    
    
    
    /* -------     SAMPLE DATA     ------- */
    static func sampleSections() -> [Section] {
        let sections = [Goal.workSection, Goal.homeSection, Goal.selfCareSection, Goal.communitySection]
        
        return sections
    }
    
    
    
}
