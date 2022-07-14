//
//  NetworkManager.swift
//  JSonserDecode
//
//  Created by Consultant on 7/13/22.
//

import Foundation

class NetworkManager {
    
    func getPokemonDecodable() -> Pokemon? {
    
        guard let path = Bundle.main.path(forResource: "Dragon", ofType: "json") else { return nil }
        
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let pokemon = try decoder.decode(Pokemon.self, from: data)
            print("Ok")
            return pokemon
        } catch {
            print("error")
            print(error)
        }
        
        return nil
    }
    
    
}
    
    
//    func getPokemonManually() -> Pokemon? {
//
//        guard let path = Bundle.main.path(forResource: "Glaceon", ofType: "json") else { return nil }
//
//        do {
//            let data = try Data(contentsOf: URL(fileURLWithPath: path))
//            let jsonObj = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//            guard let baseDict = jsonObj as? [String: Any] else { return nil }
//            return parsePokemonManually(base: baseDict)
//        } catch {
//            print(error)
//        }
//
//        return nil
//    }
//
//
//    private func parsePokemonManually(base: [String: Any]) -> Pokemon? {
//
//        guard let damage_relationasDict = base["damage_relations"] as? [String: Any] else { return nil }
//        guard let doubledamagefromArr = damage_relationasDict["double_damage_from"] as? [[String: Any]] else {return nil}
//        var findoubledamageArr: [Generation] = []
//
//        doubledamagefromArr.forEach{ value in
//            guard let doubledamageName = value["name"] as? String else { return }
//            guard let doubledamageUrl = value["url"] as? String else { return }
//            findoubledamageArr.append(Generation(name: doubledamageName,  url: doubledamageUrl))
//        }
//
//        guard let doubledamageToArr = damage_relationasDict["double_damage_to"] as? [[String: Any]] else {return nil}
//        var findoubledamagetoArr: [Generation] = []
//
//        doubledamageToArr.forEach{ value in
//            guard let doubledamageToName = value["name"] as? String else { return }
//            guard let doubledamageToUrl = value["url"] as? String else { return }
//            findoubledamagetoArr.append(Generation(name:doubledamageToName, url: doubledamageToUrl))
//        }
//
//
//
//        guard let halfdamageToArr = damage_relationasDict["half_damage_to"] as? [[String: Any]] else {return nil}
//        var finhalfdamagetoArr: [Generation] = []
//
//        halfdamageToArr.forEach{ value in
//            guard let halfdamageToName = value["name"] as? String else { return }
//            guard let halfdamageToUrl = value["url"] as? String else { return }
//            finhalfdamagetoArr.append(Generation(name: halfdamageToName, url: halfdamageToUrl))
//        }
//
//
//
//
//        guard let halfdamageFromArr = damage_relationasDict["half_damage_from"] as? [[String: Any]] else {return nil}
//        var finhalfdamagefromArr: [Generation] = []
//
//        halfdamageFromArr.forEach{ value in
//            guard let halfdamagefromName = value["name"] as? String else{return}
//            guard let halfdamagefromUrl = value["url"] as? String else{return}
//            finhalfdamagefromArr.append(Generation(name: halfdamagefromName, url: halfdamagefromUrl))
//
//        }
//
//        guard let noDamageFromArr = damage_relationasDict["no_damage_from"] as? [String]
//        else{return nil}
//        var finnoDamageFromArr: [String?]
//
//        guard let noDamageToArr =
//                damage_relationasDict["no_damage_to"] as? [[String: Any]] else{return nil}
//        var finnoDamageToArr : [Generation] = []
//        noDamageToArr.forEach{value in guard let finnoDamageToName = value["name"] as? String else {return}
//
//            guard let finnoDamageToUrl = value["url"] as? String else {return}
//            finnoDamageToArr.append(Generation(name: finnoDamageToName, url: finnoDamageToUrl))
//
//        }
//
//        var damage_relationasDictfin =
//
//        ["double_damage_from": findoubledamageArr,
//         "double_damage_to": findoubledamagetoArr,
//         "half_damage_to": finhalfdamagetoArr,
//         "half_damage_from": finhalfdamagefromArr,
//         "no_damage_from": finhalfdamagefromArr,
//         "no_damage_to": noDamageToArr] as [String : Any]
//
////
////        finDamage.append(findoubledamageArr, findoubledamagetoArr,finhalfdamagetoArr, finhalfdamagefromArr, finnoDamageToArr, finnoDamageFromArr)
//
//        guard let gameIndicesArr = base["game_indices"] as? [[String: Any]] else { return nil }
//        var finalGameIndices: [GameIndex] = []
//        gameIndicesArr.forEach{ value in
//            guard let gameIndex = value["game_index"] as? Int else { return }
//            guard let generation = value["generation"] as? [String: Any] else { return }
//            guard let generationName = generation["name"] as? String  else { return }
//            guard let generationUrl = generation["url"] as? String else{return}
//
////            guard let returngeneration = createNameLink(dict: generation) else { return }
//
//
////            finalGameIndices.append(GameIndex(gameIndex: gameIndex, generation: returngeneration))
//            finalGameIndices.append(GameIndex(gameIndex: gameIndex, generation: Generation(name: generationName, url: generationUrl)))
//        }
//
//
//        guard let movesArr = base["moves"] as? [[String: Any]] else { return nil }
//        var finalMoves: [Generation] = []
//        movesArr.forEach { value in
//            guard let moveName = value["name"] as? String else { return }
//            guard let moveUrl = value["url"] as? String else { return }
//            finalMoves.append(Generation(name: moveName, url: moveUrl))
//        }
//
//        guard let id = base["id"] as? Int else { return nil }
//        guard let name = base["name"] as? String else { return nil }
//
//        guard let gene = base["generation"] as? [String: Any] else{return nil}
//        guard let geneName = gene["name"] as? String else{return nil}
//        guard let geneUrl = gene["url"] as? String else{return nil}
//        var genef = ["Name": geneName, "url": geneUrl]
//
//        guard let base_move = base["move_damage_class"] as? [String: Any] else{return nil}
//        guard let base_move_name = base_move["name"] as? String else {return nil}
//        guard let base_move_url =  base_move["url"] as? String else{return nil}
//
//
//
//        var base_f = ["name": base_move_name, "url": base_move_url]
//
//
//        guard let pokArr = base["pokemon"] as? [[String:Any]] else{return nil}
//        var pokFinArr: [PokemonNameLink] = []
//
//        pokArr.forEach{ value in
//            guard let pokpok = value["pokemon"] as? [String:String] else{return}
//            guard let pokSlot = value["slot"] as? Int else{return}
//
//            guard let pokName = pokpok["name"] else{return}
//            guard let pokUrl = pokpok["url"] else{return}
//
//            pokFinArr.append(PokemonNameLink(pokemon: Generation(name: pokName, url: pokUrl), slot: pokSlot))
//        }
//
//
//        return Pokemon(damageRelations: damage_relationasDictfin, gameIndices: finalGameIndices, generation: genef, id: id, moveDamageClass: base_f, moves:  finalMoves, name: name, pokemon: pokFinArr)
    //}
        
        
        
        
        
        
        
        
        
        
        
        
        
        

//}
