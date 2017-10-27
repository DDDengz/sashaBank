//
//  TransactionsVC.swift
//  SashaBank
//
//  Created by Alex Dearden on 24/10/2017.
//  Copyright © 2017 Alex Dearden. All rights reserved.
//

import UIKit

class TransactionsVC: UITableViewController {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var transactionsModel: TransactionsModel!
    
    let cellIdentifier: String = "TransactionCell"
    
    var transactionToPass: Transaction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.configUI()
    }
    
    private func configUI() {
        self.balanceLabel.text = self.transactionsModel.balanceLabel()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactionsModel.transactions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? TransactionCell else {
            return UITableViewCell()
        }
        
        cell.transactionLabel.text = self.transactionsModel.transactionLabel(for: indexPath)
        cell.dateLabel.text = self.transactionsModel.dateLabel(for: indexPath)
        cell.amountLabel.text = self.transactionsModel.amountLabel(for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transaction = self.transactionsModel.transactions[indexPath.row]
        
        self.transactionToPass = transaction
        
        performSegue(withIdentifier: "TransactionDetails", sender: self)
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? DetailsVC else {
            return
        }
        
        destinationVC.currentTransaction = self.transactionToPass
    }

}
