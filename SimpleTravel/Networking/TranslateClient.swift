//
//  TranslateClient.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 26/09/2021.
//

import Foundation

class TranslateClient {
    private let weatherApiKey = valueForAPIKey(named: "googleApiKey")
    static var shared = TranslateClient()
    private init() {}
    private var task: URLSessionDataTask?
    private var translateClientSession = URLSession(configuration: .default)
    init(currencySession: URLSession) {
        self.translateClientSession = currencySession
    }
    
    func getTranslate(translationBody: Translate, callback: @escaping (Result<TranslationText?, Error>) -> Void) {
        
        guard let text = translationBody.text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else
        { return }
        let baseURL = "https://translation.googleapis.com"
        let path = "/language/translate/v2?"
        let format = "&format=\(translationBody.format)"
        let key = "&key=\(weatherApiKey)"
        let target = "&target=\(translationBody.target.rawValue)"
        let source = "&source=\(translationBody.source.rawValue)"
        let param = "q=\(text)\(source)\(target)\(format)\(key)"
        
        guard let translateURL = URL(string: "\(baseURL)\(path)\(param)") else { return }
        task?.cancel()
        task = translateClientSession.dataTask(with: translateURL) { (data, response, error) in
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    callback(.failure(NetWorkError.noData))
                    print("erreur")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(.failure(NetWorkError.badUrl))
                    return
                }
                
                do {
                    let currencyResponse = try JSONDecoder().decode(TranslateResponse.self, from: data)
                    let currencyData = currencyResponse.data
                    let currencyText = currencyData.translations.first
                    callback(.success(currencyText))
                } catch {
                    callback(.failure(NetWorkError.jsonError))
                }
            }
        }
        task?.resume()
    }
}
