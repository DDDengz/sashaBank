//
//  DetailsVC.swift
//  SashaBank
//
//  Created by Alex Dearden on 24/10/2017.
//  Copyright © 2017 Alex Dearden. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var payeeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var referenceLabel: UILabel!
    
    var currentTransaction: Transaction?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureUI()
    }

    private func configureUI() {
        // Note: There might be a case to put this code in the model...
        //... but also setting instance variable values should be the View Controller's responsibility
        self.payeeLabel.text = self.currentTransaction?.receiverDisplayName
        self.dateLabel.text = self.currentTransaction?.date.toString()
        self.statusLabel.text = self.currentTransaction?.status.rawValue.capitalized
        self.amountLabel.text = self.currentTransaction?.amount.formatAsCurrency()
        self.referenceLabel.text = self.currentTransaction?.reference
    }

}
