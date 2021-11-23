//
//  CelulaTableViewCell.swift
//  ProvaIos27
//
//  Created by COTEMIG on 14/03/38 ERA1.
//

import UIKit

class CelulaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAluno: UILabel!
    @IBOutlet weak var lblNota: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
