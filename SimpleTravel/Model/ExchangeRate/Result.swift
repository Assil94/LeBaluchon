//
//  Result.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 19/01/2021.
//

import Foundation

struct ResultInfo {
    let result: String
    let currency: String
    let money: Double
    
    enum Status {
        case accepted
        case rejected(String)
    }
}

//extension ResultInfo {
//    var status: Status {
//        if result == "0" || result == nil   {
//            return .rejected("Un problème est survenue lors de la conversion")
//        }
//        if currency.isEmpty || currency == nil {
//            return .rejected("Nous n'avons pas pu optenir la devise")
//        }
//        if money == nil || money == 0 {
//            return .rejected("Veuillez entrer un montant !")
//        }
//        return .accepted
//    }
//}
