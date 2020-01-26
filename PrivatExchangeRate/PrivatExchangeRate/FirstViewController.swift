//
//  FirstViewController.swift
//  PrivatExchangeRate
//
//  Created by Mr Jake on 18.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//

import UIKit
import Moya

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
    var currency = [Currency]()

    let urlString = "https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11"
    let provider = MoyaProvider<PrivatAPI>()

    override func viewDidLoad() {
        super.viewDidLoad()
        requestCurrency()
    }

    // MARK: - IBAction refreshDataButton
    @IBAction func refreshDataButton(_ sender: UIBarButtonItem) {
        requestCurrency()
    }

    // MARK: - Functions

    private func requestCurrency() {
        provider.request(.getCurrency ) { rates in
            do {
                let response = try rates
                    .get()
                self.currency = try response.map([Currency].self)
                self.handle()
                DispatchQueue.main.async {
                    self.fillLabel()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    private func handle() {
        currencyName = currency.map { (cur) -> String in
            return cur.currency
        }
        currencyValueBuy = currency.map { (cur) -> String in
            return String(cur.buy)
        }
        currencyValueSale = currency.map { (cur) -> String in
            return String(cur.sale)
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
