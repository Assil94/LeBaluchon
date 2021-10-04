

import UIKit

class PresentExchangeRateController: UIViewController {
    let exchangeRateViewModel = ExchangeRateViewModel()
    @IBOutlet weak var monneyTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var resultInfo: ResultInfo?
    
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
        getRateResult()
    }
}

extension PresentExchangeRateController {
    private func configureRate() {
        exchangeRateViewModel.getRate {
            guard self == self else { return }
            print(self.exchangeRateViewModel.currencyRate)
            print(self.exchangeRateViewModel.currencyValue)
        }
    }
    private func getRateResult() {
        convertMoney()
    }
    private func convertMoney() {
        guard ((monneyTextField.text?.isEmpty) != true) else { return }
        guard exchangeRateViewModel.currencyValue.contains(1) else { return }
        let result = Double(monneyTextField.text!)! * exchangeRateViewModel.currencyValue[0]
        resultLabel.text = String(result)
    }
}


