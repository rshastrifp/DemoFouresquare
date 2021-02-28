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
    }
    
    func configureCell(title: String, details: String, tumbImageUrl: String) {
        self.labelName.text = title
        self.labelDetails.text = details
        setTumbImage(urlString: tumbImageUrl)
    }
    
    func setTumbImage(urlString: String) {
        print(urlString)
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.imageView?.image = image
                        }
                    }
                }
            }
        }
        self.imageView?.image = UIImage(named: "Placeholder")
    }
    
    override func prepareForReuse() {
        self.imageView?.image = UIImage()
    }
}
