

import UIKit

class PresentExchangeRateController: UIViewController {
    let exchangeRateViewModel = ExchangeRateViewModel()
    @IBOutlet weak var monneyTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var conversionResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRate()
    }
}

extension PresentExchangeRateController {
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        monneyTextField.resignFirstResponder()
    }
    @IBAction func didTapGetResultButton(_ sender: Any) {
        configureRate()
    }
}

extension PresentExchangeRateController {
    private func configureRate() {
        exchangeRateViewModel.getRate {
            guard self == self else { return }
            self.getRateResult()
        }
    }
    private func getRateResult() {
        convertMoney()
    }
    private func convertMoney() {
        guard !monneyTextField.text!.isEmpty else {
            /// send an error
            return }
        guard exchangeRateViewModel.currencyValue != nil else { return }
        let result = Double(monneyTextField.text!)! * exchangeRateViewModel.currencyValue!
        resultLabel.text = String(Int(result))
        conversionResult.text = "1 EUR = \(String(exchangeRateViewModel.currencyValue!)) USD"
    }
}


