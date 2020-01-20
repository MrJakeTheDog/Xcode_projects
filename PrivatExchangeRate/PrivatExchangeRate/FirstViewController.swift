//
//  FirstViewController.swift
//  PrivatExchangeRate
//
//  Created by Mr Jake on 18.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - IBOutlet Label
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var rurLabel: UILabel!
    @IBOutlet weak var btcLabel: UILabel!
    @IBOutlet weak var usdCurrencyLabel: UILabel!
    @IBOutlet weak var eurCurrencyLabel: UILabel!
    @IBOutlet weak var rurCurrencyLabel: UILabel!
    @IBOutlet weak var btcCurrencyLabel: UILabel!

    // MARK: - Variable
    var currencyName: [String] = []
    var currencyValueBuy: [String] = []
    var currencyValueSale: [String] = []

    let urlString = "https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11"

    override func viewDidLoad() {
        super.viewDidLoad()
        requestCurrencyExchangeRate(url: urlString)
    }

    // MARK: - IBAction refreshDataButton
    @IBAction func refreshDataButton(_ sender: UIBarButtonItem) {
        requestCurrencyExchangeRate(url: urlString)
    }

    // MARK: - Functions
    private func requestCurrencyExchangeRate(url: String) {
        guard let url = URL(string: url) else { return }

        URLSession
            .shared
            .dataTask(with: url) { (data, response, error) in
                guard let response = response as? HTTPURLResponse else { return }
                if let data = data, (200...299).contains(response.statusCode) {
                    self.handle(responseData: data)
                }
                if let _ = data, (300...600).contains(response.statusCode) {
                    print("IT'S NOT OK!!! ERROR")
                }
        }.resume()
    }

    private func handle(responseData: Data) {
        let currency = try! JSONDecoder().decode([Currency].self, from: responseData)
        currencyName = currency.map { (cur) -> String in
            return cur.currency
        }
        currencyValueBuy = currency.map { (cur) -> String in
            return String(cur.buy)
        }
        currencyValueSale = currency.map { (cur) -> String in
            return String(cur.sale)
        }
        DispatchQueue.main.async {
            self.fillLabel()
        }
    }

    private func fillLabel(){
        usdLabel.text = currencyName[0]
        eurLabel.text = currencyName[1]
        rurLabel.text = currencyName[2]
        btcLabel.text = currencyName[3]

        let btcUahBuy = Double(currencyValueBuy[3])! * Double(currencyValueBuy[0])!
        let btcUahSell = Double(currencyValueSale[3])! * Double(currencyValueSale[0])!

        usdCurrencyLabel.text = String(currencyValueBuy[0]) + " / " + String(currencyValueSale[0])
        eurCurrencyLabel.text = String(currencyValueBuy[1]) + " / " + String(currencyValueSale[1])
        rurCurrencyLabel.text = String(currencyValueBuy[2]) + " / " + String(currencyValueSale[2])
        btcCurrencyLabel.text = String(format: "%.2f", btcUahBuy) + " / " + String(format: "%.2f", btcUahSell)
    }
}
