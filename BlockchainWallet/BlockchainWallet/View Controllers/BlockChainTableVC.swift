//
//  TransactionTableVC.swift
//  BlockchainWallet
//
//  Created by Marlon Raskin on 4/9/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import UIKit

class BlockChainTableVC: UITableViewController {

	// MARK: - Outlets & Properties

    override func viewDidLoad() {
        super.viewDidLoad()
		NetworkManager.shared.fetchBlockChain { [weak self] _ in
			guard let self = self else { return }
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return NetworkManager.shared.blockchain.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "BlockCell", for: indexPath) as? BlockCell else { return UITableViewCell() }
		let block = NetworkManager.shared.blockchain[indexPath.row]
		cell.block = block

        return cell
    }


	// MARK: - IBActions
	@IBAction func personButtonTapped(_ sender: UIBarButtonItem) {
		editUserAlert()
	}



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "transactionSegue" {
			guard let navController = segue.destination as? UINavigationController else { return }
			guard let transactionVC = navController.viewControllers.first as? TransactionTableVC else { return }

			guard let indexPath = tableView.indexPathForSelectedRow else { return }

			let block = NetworkManager.shared.blockchain[indexPath.row]
			transactionVC.blockIndex = block.index
			transactionVC.transactions = block.transactions
		}
    }



	// MARK: - Helper Functions
	private func editUserAlert() {
		let ac = UIAlertController(title: "Enter User ID", message: nil, preferredStyle: .alert)
		ac.view.tintColor = .systemIndigo
		ac.addTextField { textField in
			textField.placeholder = "User ID"
		}
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
		let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
			guard let textField = ac.textFields?.first else { return }
			let input = textField.text ?? ""
			// Do save code here
			print(input)
		}

		[cancelAction, saveAction].forEach(ac.addAction(_:))
		present(ac, animated: true)
	}

}
