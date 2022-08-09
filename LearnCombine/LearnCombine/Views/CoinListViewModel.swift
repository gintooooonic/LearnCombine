//
//  CoinListViewModel.swift
//  LearnCombine
//
//  Created by Woody on 2022/08/09.
//

import Foundation
import Combine

class CoinListViewModel: ObservableObject {
	private let cryptoService = CryptoService()
	@Published var coinViewModels = [CoinViewModel]()
	
	var cancellable: AnyCancellable?
	
	func fetchCoins() {
		cancellable = cryptoService.fetchCoins().sink(receiveCompletion: { _ in
			
		}, receiveValue: { cryptoContainer in
			self.coinViewModels = cryptoContainer.data.coins.map { CoinViewModel($0) }
			print(self.coinViewModels)
		})
	}
}
