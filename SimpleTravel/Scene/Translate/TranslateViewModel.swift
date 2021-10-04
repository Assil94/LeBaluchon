//
//  TranslateViewModel.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 30/09/2021.
//

import Foundation

class TranslateViewModel {
    var translatedTextHandler: (_ translatedText: String?) -> Void = { _  in }
    func getTranslate(param: Translate) {
        TranslateClient.shared.getTranslate(translationBody: param) { result in
            switch result {
            case .success(let text):
                self.translatedTextHandler(text?.translatedText)
            case .failure(let error):
                print(error)
            }
        }
    }
}
