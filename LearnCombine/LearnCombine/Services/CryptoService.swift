//
//  CryptoService.swift
//  LearnCombine
//
//  Created by Woody on 2022/08/09.
//

import Foundation
import Combine

final class CryptoService {
	var components: URLComponents {
		var components = URLComponents()
		components.scheme = "https"
		components.host = "api.coinranking.com"
		components.path = "/v2/coins"
		components.queryItems = [URLQueryItem(name: "timePeriod", value: "24h")]
		return components
	}
	
	func fetchCoins() -> AnyPublisher<CryptoDataContainer, Error> {
		return URLSession.shared.dataTaskPublisher(for: components.url!)
			.map { $0.data }
			.decode(type: CryptoDataContainer.self, decoder: JSONDecoder())
			.eraseToAnyPublisher()
	}
}
