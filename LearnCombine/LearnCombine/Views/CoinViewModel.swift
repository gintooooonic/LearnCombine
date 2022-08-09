//
//  CoinViewModel.swift
//  LearnCombine
//
//  Created by Woody on 2022/08/09.
//

import Foundation

struct CoinViewModel: Hashable {
	private let coin: Coin
	
	var name: String {
		return coin.name
	}
	
	var formattedPrice: String {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .currency
		
		guard let price = Double(coin.price), let formattedPrice =
				numberFormatter.string(from: NSNumber(value: price)) else { return "" }
		
		return formattedPrice
	}
	
	var displayText: String {
		return name + " - " + formattedPrice
	}
	
	init(_ coin: Coin) {
		self.coin = coin
	}
}
