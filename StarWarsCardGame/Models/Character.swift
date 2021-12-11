//
//  Character.swift
//  StarWarsCardGame
//
//  Created by Anto Rados on 12/10/21.
//

import UIKit

class Character {
    var name: String
    var photo: UIImage?
    var faction: String
    
    init(name: String, photo: UIImage?, faction: String) {
        self.name = name
        self.photo = photo
        self.faction = faction
    
    }  //End initializer
} //End "Character" class


extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.name == rhs.name && lhs.photo == rhs.photo && lhs.faction == rhs.faction
    
    }
} //End Equatable protocol
