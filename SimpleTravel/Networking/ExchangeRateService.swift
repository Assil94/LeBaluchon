//
//  ExchangeRateService.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 30/12/2020.
//

import Foundation


class ExchangeRateService {
    
    
    private let exchangeRateKey = valueForAPIKey(named: "fixerApiKey")
    static var shared = ExchangeRateService()
    private init() {}
    private var task: URLSessionDataTask?
    private var exchangeRateSession = URLSession(configuration: .default)
    init(currencySession: URLSession) {
        self.exchangeRateSession = currencySession
    }
    
    func getExchangeRate(callback: @escaping (Result<Rates, Error>) -> Void) {
        let baseURL = "http://data.fixer.io"
        let path = "/api/latest?"
        let param = "access_key=\(exchangeRateKey)&base=EUR&symbols=USD"
        guard let exchangeRateUrl = URL(string: "\(baseURL)\(path)\(param)") else { return }
        
        task?.cancel()
        task = exchangeRateSession.dataTask(with: exchangeRateUrl) { (data, response, error) in
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    callback(.failure(NetWorkError.noData))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(.failure(NetWorkError.badUrl))
                    return
                }
                
                do {
                    let currencyResponse = try JSONDecoder().decode(Rates.self, from: data)
                    callback(.success(currencyResponse))
                } catch {
                    callback(.failure(NetWorkError.jsonError))
                }
            }
        }
        task?.resume()
    }
}
