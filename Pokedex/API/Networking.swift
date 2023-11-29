//
//  Networking.swift
//  Pokedex
//
//  Created by Nathan Mora on 24/11/23.
//

import Foundation

/// Protocolo utilizado para traer la lista de pokemons disponibles.
protocol pokemonDataManagerDelegateProtocol {
    func showListPokemons(dataList: [Pokemon])
}

struct DataManager {
    var delegate: pokemonDataManagerDelegateProtocol?
    func showPokemons() {
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("Error al obtener datos de la API", error?.localizedDescription ?? "error desconocido.")
                }
                
                if let saveData = data?.parseData(quitarString: "null,") {
                    if let listPokemons = self.parseJSON(dataPokemon: saveData) {
                        delegate?.showListPokemons(dataList: listPokemons)
                    }
                }
            }
               task.resume()
        }
    }
   
   func showPokemonRandom(numberItem: Int) {
       let urlString = "https://pokeapi.co/api/v2/pokemon/\(numberItem)"
       if let url = URL(string: urlString) {
           let session = URLSession(configuration: .default)
           
           let task = session.dataTask(with: url) { data, response, error in
               if error != nil {
                   print("Error al obtener datos de la API", error?.localizedDescription ?? "error desconocido.")
               }
               
              let decoder = JSONDecoder()
              do {
                 let decodeData = try decoder.decode(PokedexId.self, from: data!)
                 print("decodeData: ", decodeData)
              } catch {
                  print("Error al decoficiar", error.localizedDescription)
              }
               
           }
              task.resume()
       }
   }
   func parseJSON2(dataPokemon: Data) ->PokedexId? {
       let decoder = JSONDecoder()
       do {
          let decodeData = try decoder.decode(PokedexId.self, from: dataPokemon)
           return decodeData
       } catch {
           print("Error al decoficiar", error.localizedDescription)
           return nil
       }
   }
    
    func parseJSON(dataPokemon: Data) ->[Pokemon]? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode([Pokemon].self, from: dataPokemon)
            return decodeData
        } catch {
            print("Error al decoficiar", error.localizedDescription)
            return nil
        }
    }
}

extension Data {
    func parseData(quitarString palabra: String) -> Data? {
        let dataString = String(data: self, encoding: .utf8)
        let paseDataString = dataString?.replacingOccurrences(of: palabra, with: "")
        guard let data = paseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
