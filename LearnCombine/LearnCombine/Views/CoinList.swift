//
//  ContentView.swift
//  LearnCombine
//
//  Created by Woody on 2022/08/09.
//

import SwiftUI

struct CoinList: View {
	@ObservedObject private var viewModel = CoinListViewModel()
	
	var body: some View {
		NavigationView {
			List(viewModel.coinViewModels, id: \.self) { coinViewModel in
				Text(coinViewModel.displayText)
			}.onAppear {
				self.viewModel.fetchCoins()
			}.navigationBarTitle("Coins")
		}
	}
}

struct CoinList_Previews: PreviewProvider {
	static var previews: some View {
		CoinList()
	}
}
