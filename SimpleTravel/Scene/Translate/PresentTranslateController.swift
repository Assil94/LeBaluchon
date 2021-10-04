//
//  PresentTranslateController.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 30/09/2021.
//

import Foundation
import UIKit
class PresentTranslateController: UIViewController {
    
    let translateViewModel = TranslateViewModel()
    @IBOutlet weak var englishLabelDisplay: UILabel!
    @IBOutlet weak var frenchLabelDisplay: UILabel!
    @IBOutlet weak var textTranslated: UILabel!
    @IBOutlet weak var textToTranslate: UITextView!
    private var language: Language = .fr
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textToTranslate.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
    }
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    @IBAction func didTapExchangeLanguage(_ sender: Any) {
        
    }
    
    @IBAction func didTapTranslate(_ sender: Any) {
        translate()
    }
    
    private func translate() {
        let textToTranslate = textToTranslate.text.trimmingCharacters(in: .whitespaces)
        guard !textToTranslate.isEmpty  else { return }
        let translationBody = Translate(source: language, text: textToTranslate)
        
        translateViewModel.getTranslate(param: translationBody)
        
        translateViewModel.translatedTextHandler = { text in
            self.textTranslated.text = text
        }
    }
}


