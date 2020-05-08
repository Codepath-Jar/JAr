//
//  ChatCell.swift
//  JAr
//
//  Created by Abdiaziz Weheliye on 5/6/20.
//  Copyright © 2020 JAr coorprate. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var userList: UITextField!
    @IBOutlet weak var messageList: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
