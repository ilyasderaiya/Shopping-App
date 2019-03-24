//
//  CheckoutTableViewCell.swift
//  Shopping App
//
//  Created by Ilyas Deraiya on 2019-03-23.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {

    @IBOutlet weak var lblProductTitle: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
