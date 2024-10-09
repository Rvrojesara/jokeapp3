//
//  JokeCell.swift
//  jokeapp3
//
//  Created by admin on 30/09/24.
//

import UIKit

class JokeCell: UITableViewCell {

    @IBOutlet weak var setuplabel: UILabel!
    @IBOutlet weak var punchlinelabel: UILabel!
    @IBOutlet weak var typelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
