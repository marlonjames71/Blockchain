//
//  BlockModel.swift
//  BlockchainWallet
//
//  Created by Marlon Raskin on 4/9/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import UIKit

struct Chain: Codable {
	let chain: [Block]
	let length: Int
}

struct Block: Codable {
	let hash: String
	let index: Int
	let previousHash: String?
	let proof: Int
	let timestamp: TimeInterval
	let transactions: [Transaction]

	var indexStr: String {
		"\(index)"
	}

	var proofStr: String {
		"\(proof)"
	}

	var dateString: String {
		DateFormatter
			.blockDate
			.string(from: Date(timeIntervalSince1970: timestamp))
	}
}


struct Transaction: Codable {
	let amount: Int
	let recipient: String
	let sender: String
}


extension DateFormatter {
	static var blockDate: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .full
		formatter.timeStyle = .full
		return formatter
	}()
}

