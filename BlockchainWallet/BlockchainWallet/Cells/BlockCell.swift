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

	var block: Block? {
		didSet {
			updateViews()
		}
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		if selected {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
				self.setSelected(false, animated: true)
			}
		}
	}


	private func updateViews() {
		guard let block = block else { return }

		blockTitle = "Block " + block.indexStr
		proofLabel.text = block.proofStr
		transactionCountLabel.text = block.transCount
		dateLabel.text = block.dateString
	}
}
