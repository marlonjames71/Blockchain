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

	func fetchBlockChain(completion: @escaping (Result<Chain, NetworkError>) -> Void) {

		let request = blockchainURL.request
		(request.decoder as? JSONDecoder)?.keyDecodingStrategy = .convertFromSnakeCase

		networkHandler.transferMahCodableDatas(with: request) { (result: Result<Chain, NetworkError>) in
			switch result {
			case .success(let chain):
				self.blockchain = chain.chain
				print(self.blockchain)
				completion(.success(chain))
			case .failure(let error):
				NSLog("Error fetching blockchain: \(error)")
				completion(.failure(error))
			}
		}
	}
}
