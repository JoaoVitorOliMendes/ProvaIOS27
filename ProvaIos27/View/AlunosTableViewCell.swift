//
//  AlunosTableViewCell.swift
//  ProvaIos27
//
//  Created by COTEMIG on 13/03/38 ERA1.
//

import UIKit

class AlunosTableViewCell: UITableViewCell {

    @IBOutlet weak var txtAluno: UILabel!
    @IBOutlet weak var txtNota: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
