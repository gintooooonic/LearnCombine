//
//  CryptoDataContainer.swift
//  LearnCombine
//
//  Created by Woody on 2022/08/09.
//

import Foundation

struct CryptoDataContainer: Decodable {
	let status: String
	let data: CryptoData
}

struct CryptoData: Decodable {
	let coins: [Coin]
}

struct Coin: Decodable, Hashable {
	let name: String
	let price: String
}
