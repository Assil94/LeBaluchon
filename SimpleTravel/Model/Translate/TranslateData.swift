//
//  TranslateData.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 30/09/2021.
//

import Foundation

struct TranslateResponse: Decodable {
    let data: TranslationData
}

struct TranslationData: Decodable {
    let translations: [TranslationText]
}

struct TranslationText: Decodable {
    let translatedText: String
}
