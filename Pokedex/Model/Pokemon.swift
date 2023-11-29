//
//  Pokemon.swift
//  Pokedex
//
//  Created by Nathan Mora on 24/11/23.
//

import Foundation

struct Pokemon: Decodable {
    
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [Types]
    let forms: [Form]
    
    var idString: String { String(describing: id) }
    
    init(id: Int = 0,
         name: String = "",
         height: Int = 0,
         weight: Int = 0,
         types: [Types] = [],
         forms: [Form] = []) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.types = types
        self.forms = forms
    }
}

struct Types: Decodable {

    let type: Type
}

struct Type: Decodable {

    let name: String
}


struct Form: Decodable {

    let name: String
}
