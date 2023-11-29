//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Nathan Mora on 24/11/23.
//
import Foundation

// MARK: - Welcome
struct PokedexId: Decodable {
    let abilities: [Ability]?
    let baseExperience: Int?
    let forms: [Species]?
    let gameIndices: [GameIndex]?
    let height: Int?
    let heldItems: [HeldItem]?
    let id: Int?
    let isDefault: Bool?
    let locationAreaEncounters: String?
    let moves: [Move]?
    let name: String?
    let order: Int?
    let pastAbilities: [String]?
    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?
}

// MARK: - Ability
struct Ability: Decodable  {
    let ability: Species
    let isHidden: Bool
    let slot: Int
}

// MARK: - Species
struct Species: Decodable  {
    let name: String
    let url: String
}

// MARK: - GameIndex
struct GameIndex: Decodable  {
    let gameIndex: Int
    let version: Species
}

// MARK: - HeldItem
struct HeldItem: Decodable  {
    let item: Species
    let versionDetails: [VersionDetail]
}

// MARK: - VersionDetail
struct VersionDetail: Decodable  {
    let rarity: Int
    let version: Species
}

// MARK: - Move
struct Move: Decodable  {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Decodable  {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species
}

// MARK: - GenerationV
struct GenerationV: Decodable  {
    let blackWhite: Sprites
}

// MARK: - GenerationIv
struct GenerationIv: Decodable  {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites
}

// MARK: - Versions
struct Versions: Decodable  {
    let generationI: GenerationI
    let generationIi: GenerationIi
    let generationIii: GenerationIii
    let generationIv: GenerationIv
    let generationV: GenerationV
    let generationVi: [String: Home]
    let generationVii: GenerationVii
    let generationViii: GenerationViii
}

// MARK: - Sprites
class Sprites: Decodable {
    let backDefault, backFemale, backShiny, backShinyFemale: String
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String
    let other: Other?
    let versions: Versions?
    let animated: Sprites?

    init(backDefault: String, backFemale: String, backShiny: String, backShinyFemale: String, frontDefault: String, frontFemale: String, frontShiny: String, frontShinyFemale: String, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: - GenerationI
struct GenerationI: Decodable  {
    let redBlue, yellow: RedBlue
}

// MARK: - RedBlue
struct RedBlue: Decodable  {
    let backDefault, backGray, backTransparent, frontDefault: String
    let frontGray, frontTransparent: String
}

// MARK: - GenerationIi
struct GenerationIi: Decodable  {
    let crystal: Crystal
    let gold, silver: Gold
}

// MARK: - Crystal
struct Crystal: Decodable  {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String
}

// MARK: - Gold
struct Gold: Decodable  {
    let backDefault, backShiny, frontDefault, frontShiny: String
    let frontTransparent: String?
}

// MARK: - GenerationIii
struct GenerationIii: Decodable  {
    let emerald: OfficialArtwork
    let fireredLeafgreen, rubySapphire: Gold
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Decodable  {
    let frontDefault, frontShiny: String
}

// MARK: - Home
struct Home: Decodable  {
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String
}

// MARK: - GenerationVii
struct GenerationVii: Decodable  {
    let icons: DreamWorld
    let ultraSunUltraMoon: Home
}

// MARK: - DreamWorld
struct DreamWorld: Decodable  {
    let frontDefault: String
    let frontFemale: String?
}

// MARK: - GenerationViii
struct GenerationViii: Decodable  {
    let icons: DreamWorld
}

// MARK: - Other
struct Other: Decodable  {
    let dreamWorld: DreamWorld
    let home: Home
    let officialArtwork: OfficialArtwork
}

// MARK: - Stat
struct Stat: Decodable  {
    let baseStat, effort: Int
    let stat: Species
}

// MARK: - TypeElement
struct TypeElement: Decodable  {
    let slot: Int
    let type: Species
}
