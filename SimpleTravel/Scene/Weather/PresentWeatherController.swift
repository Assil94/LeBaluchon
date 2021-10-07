//
//  PresentWeatherController.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 03/02/2021.
//

import Foundation
import UIKit

class PresentWeatherController: UIViewController {
    let me = WeatherViewModel()
    @IBOutlet weak var UISearchBar: UISearchBar!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UISearchBar.delegate = self
    }

   private func getWeather(city: String) {
        me.getWeather(city: city)
        me.weatherHandler = { [weak self] weather in
            guard let me = self else { return }
            let day = Date()
            me.dayLabel.text = day.formatted(dateFormat: "EEEE dd MMMM").capitalized
            me.weatherLabel.text = "\(weather.temperature)°"
            me.tempMinLabel.text = "\(weather.tempMin)° temperature minimum"
            me.tempMaxLabel.text = "\(weather.tempMax)° temperature maximum"
            me.feelsLikeLabel.text = "\(weather.feelsLike) temperature ressentie"
            me.descriptionLabel.text = weather.description
        }
    }
}

extension PresentWeatherController: UISearchBarDelegate  {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let locationString = searchBar.text, !locationString.isEmpty {
            getWeather(city: locationString)
        }
       searchBar.resignFirstResponder()
    }
}

