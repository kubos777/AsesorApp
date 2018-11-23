//
//  PublicacionTableViewCell.swift
//  final
//
//  Created by kubOS on 11/23/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class PublicacionTableViewCell: UITableViewCell {

    @IBOutlet weak var temaOutlet: UILabel!
    @IBOutlet weak var fechaOutlet: UILabel!
    @IBOutlet weak var precioOutlet: UILabel!
    @IBOutlet weak var usuarioOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
