//
//  TransactionTableVC.swift
//  BlockchainWallet
//
//  Created by Marlon Raskin on 4/9/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import UIKit

class TransactionTableVC: UITableViewController {

	var transactions: [Transaction] = [] {
		didSet {
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	var blockIndex: Int = 0 {
		didSet {
			navigationItem.prompt = "Block \(blockIndex)"
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
	}

	// MARK: - Table view data source

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		transactions.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? TransactionCell else { return UITableViewCell() }
		let transaction = transactions[indexPath.row]
		cell.transaction = transaction
		return cell
	}


	// MARK: - IBActions
	@IBAction func xButtonTapped(_ sender: UIBarButtonItem) {
		dismiss()
	}

	// MARK: - Helper Functions
	private func dismiss() {
		dismiss(animated: true)
	}
}
