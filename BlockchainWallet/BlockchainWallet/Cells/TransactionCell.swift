//
//  TransactionCell.swift
//  BlockchainWallet
//
//  Created by Marlon Raskin on 4/9/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {

	// MARK: - Properties & Outlets
	@IBOutlet weak var amountLabel: UILabel!
	@IBOutlet weak var recipientLabel: UILabel!
	@IBOutlet weak var senderLabel: UILabel!

	var transaction: Transaction? {
		didSet {
			updateViews()
		}
	}

	private func updateViews() {
		guard let transaction = transaction else { return }
		amountLabel.text = transaction.amountStr
		recipientLabel.text = transaction.recipient
		senderLabel.text = transaction.sender
	}

}
