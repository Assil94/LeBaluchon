

import Foundation


class ExchangeRateViewModel {
    var errorHandler: (_ title: String, _ message: String) -> Void = { _, _ in }
    var currencyName: String?
    var currencyValue: Double?
    var result: Double?
    
    func getRate(callback: @escaping () -> Void) {
        ExchangeRateService.shared.getExchangeRate() { [self] (result) in
            switch result {
            case .success(let exchangeRate):
                exchangeRate.rates.forEach { (key, value) in
                    self.currencyName = key
                    self.currencyValue = value
                }
                callback()
            case .failure:
                self.errorHandler("erreur", "erreur")
            }
        }
    }
}
