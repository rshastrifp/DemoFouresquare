//
//  VanueTableViewCell.swift
//  demoProj
//
//  Created by Ronak Shahstri on 2021-02-27.
//

import UIKit

class VanueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDetails: UILabel!
    @IBOutlet weak var imageViewThumb: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title: String, details: String, tumbImage: UIImage) {
        self.labelName.text = title
        self.labelDetails.text = details
        self.imageViewThumb?.image = tumbImage
    }

}
