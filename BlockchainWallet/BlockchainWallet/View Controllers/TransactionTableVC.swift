//
//  TransactionTableVC.swift
//  BlockchainWallet
//
//  Created by Marlon Raskin on 4/9/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import UIKit

class TransactionTableVC: UITableViewController {

	var block: Block?

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
	}

	// MARK: - Table view data source

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 1
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? TransactionCell else { return UITableViewCell() }
		cell.amountLabel.text = "300"
		cell.recipientLabel.text = "Gunship"
		cell.senderLabel.text = "Unknown"
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
