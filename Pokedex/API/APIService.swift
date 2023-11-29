//
//  APIService.swift
//  Pokedex
//
//  Created by Nathan Mora on 24/11/23.
//
import Alamofire
import Foundation

class APIService {
   static let shared = APIService()

   func fetchPokemon(numberRandom: String, completionHandler: @escaping (Pokemon) -> ())  {
      let baseUrlPokemon = "https://pokeapi.co/api/v2/pokemon/\(numberRandom)"

      AF.request(baseUrlPokemon, method: .get, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
         
         if let err = dataResponse.error {
            print("Failed to contact API", err)
            return
         }
         
         guard let data = dataResponse.data else { return }
         print("DataResponse ", data )
         do {
            let result = try JSONDecoder().decode(Pokemon.self, from: data)
            completionHandler(result)
            print("RESULT ", result)
         } catch let decodeErr {
            print("Failed to decode:::", decodeErr)
         }
      }
   }

}
