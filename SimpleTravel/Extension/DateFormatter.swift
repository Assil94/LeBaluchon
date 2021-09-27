//
//  DateFormatter.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 22/09/2021.
//

import Foundation

private let dateFormatter = DateFormatter()

extension Date {
    func formatted(dateFormat: String = "EEEE") -> String {
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
