//
//  BlockCell.swift
//  BlockchainWallet
//
//  Created by Marlon Raskin on 4/9/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import UIKit

class BlockCell: UITableViewCell {

    // MARK: - Outlets & Properties
	@IBOutlet weak var blockbutton: UIButton!
	@IBOutlet weak var proofLabel: UILabel!
	@IBOutlet weak var transactionCountLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!

	var blockTitle: String = "" {
		didSet {
			blockbutton.setTitle(blockTitle, for: .normal)
		}
	}
}
