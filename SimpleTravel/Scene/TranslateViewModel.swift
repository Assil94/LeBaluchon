//
//  TranslateViewModel.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 30/09/2021.
//

import Foundation

class TranslateViewModel {
    var translatedTextHandler: (_ translatedText: String?) -> Void = { _  in }
    func getTranslate(sentence: String) {
        TranslateClient.shared.getTranslate(sentence: sentence) { result in
            switch result {
            case .success(let text):
                self.translatedTextHandler(text?.translatedText)
            case .failure(let error):
                print(error)
            }
        }
    }

}
