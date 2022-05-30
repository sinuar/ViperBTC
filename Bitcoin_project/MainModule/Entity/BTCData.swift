//
//  BTCData.swift
//  Bitcoin_project
//
//  Created by Sinuhé Ruedas on 03/05/22.
//

import Foundation

struct BTCData: Codable {
    let currency: String?
    let rates: [String: String]?
    
    init(currency: String? = nil, rates: [String: String]? = nil ){
        self.currency = currency
        self.rates = rates
    }
}
