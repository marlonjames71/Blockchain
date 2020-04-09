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
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "BlockCell", for: indexPath) as? BlockCell else { return UITableViewCell() }
		cell.blockTitle = "Block 2"
		cell.dateLabel.text = "02/03/2020"
		cell.proofLabel.text = "2003"
		cell.transactionCountLabel.text = "23"

        return cell
    }


	// MARK: - IBActions
	@IBAction func personButtonTapped(_ sender: UIBarButtonItem) {
		editUserAlert()
	}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


	// MARK: - Helper Functions
	private func editUserAlert() {
		let ac = UIAlertController(title: "Enter User ID", message: nil, preferredStyle: .alert)
		ac.view.tintColor = .systemIndigo
		ac.addTextField { textField in
			textField.placeholder = "User ID"
		}
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
		let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
			// Do save code here
			guard let textField = ac.textFields?.first else { return }
			let input = textField.text ?? ""
			print(input)
		}

		[cancelAction, saveAction].forEach(ac.addAction(_:))
		present(ac, animated: true)
	}

}
