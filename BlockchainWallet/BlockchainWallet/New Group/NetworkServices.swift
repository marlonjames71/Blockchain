//
//  NetworkServices.swift
//  BlockchainWallet
//
//  Created by Marlon Raskin on 4/9/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import Foundation
import NetworkHandler

class NetworkManager {

	static let shared = NetworkManager()

	let networkHandler = NetworkHandler.default

	var blockchain: [Block] = []

	let blockchainURL = URL(string: "http://localhost:5000/chain")!

	var jsonDecoder: JSONDecoder {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		return decoder
	}

	func fetchBlockChain() {

		var request = blockchainURL.request
		request.decoder = jsonDecoder

		networkHandler.transferMahCodableDatas(with: request) { (result: Result<Chain, NetworkError>) in
			switch result {
			case .success(let chain):
				self.blockchain = chain.chain
				print(self.blockchain)
			case .failure(let error):
				NSLog("Error fetching blockchain: \(error)")
			}
		}

//		let dataTask = URLSession.shared.dataTask(with: blockchainURL) { data, response, error in
//			if let error = error {
//				NSLog("Error with dataTask: \(error)")
//				return
//			}
//
//			guard let response = response as? HTTPURLResponse,
//				response.statusCode == 200 else {
//					NSLog("Bad status code")
//					return
//			}
//
//			guard let data = data else {
//				NSLog("Error fetching data")
//				return
//			}
//
//			print(data)
//
//		}.resume()
	}
}
