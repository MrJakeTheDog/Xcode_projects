//
//  PrivatBankData.swift
//  PrivatExchangeRate
//
//  Created by Mr Jake on 20.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//

import Foundation

// MARK: - JSON Structure
/*
 {
     "ccy": "USD",
     "base_ccy": "UAH",
     "buy": "24.05000",
     "sale": "24.50980"
 }
 */

struct Currency: Codable {
    let currency: String
    let baseCurrency: String
    let buy: Double
    let sale: Double

    enum CodingKeys: String, CodingKey {
        case currency = "ccy"
        case baseCurrency = "base_ccy"
        case buy
        case sale
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let currency = try container.decode(String.self, forKey: .currency)
        self.currency = String(currency)
        let baseCurrency = try container.decode(String.self, forKey: .baseCurrency)
        self.baseCurrency = String(baseCurrency)
        let buy = try container.decode(String.self, forKey: .buy)
        self.buy = Double(buy)!
        let sale = try container.decode(String.self, forKey: .sale)
        self.sale = Double(sale)!
    }
}

/*
 {
     "name": "Черкасское ГРУ",
     "city": "Черкассы",
     "email": "cs@pbank.com.ua",
     "address": "ул Благовестная 169"
 }
 */

struct Office: Codable {
    let name: String
    let city: String
    let phone: String
    let address: String
}
