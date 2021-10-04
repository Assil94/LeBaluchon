//
//  Translate.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 04/10/2021.
//

import Foundation

struct Translate {
    let source: Language
    let target: Language
    let text: String
    let format = "text"
    init(source: Language, text: String) {
        self.source = source
        self.target = (source == .fr) ? .en : .fr
        self.text = text
    }
}

enum Language: String {
    case fr, en
}
