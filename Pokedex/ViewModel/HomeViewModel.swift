//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Nathan Mora on 25/11/23.
//

import UIKit

class HomeViewModel: NSObject {
    public var  pokemon: Pokemon?
    private var manager = APIService()
    
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [Types]
    let forms: [Form]
    
    
    public init(with pokemon: Pokemon?) {
        self.pokemon = pokemon
        self.id = pokemon?.id ?? 0
        self.name = pokemon?.name ?? ""
        self.height = pokemon?.height ?? 0
        self.weight = pokemon?.weight ?? 0
        self.types = pokemon?.types ?? []
        self.forms = pokemon?.forms ?? []
    }
    
    
    func fetchPokemons(numberRandom: String, completion: @escaping () -> Void ) {
        let number = Int.random(in: 0 ... 25)
        let myString = String(number)
        manager.fetchPokemon(numberRandom: myString) { Pokemon in
            DispatchQueue.main.async { [self] in
                self.pokemon = Pokemon
                completion()
            }
        }
    }
}
