//
//  CourseCell.swift
//  CatCollection
//
//  Created by Kima on 13.09.2023.
//

import UIKit

final class CatCell: UITableViewCell {
    
    @IBOutlet var catImage: UIImageView!
    @IBOutlet var sizeImageLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    func configure(with cat: Cat) {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        sizeImageLabel.text = "Разрешение фото: \(cat.width)х\(cat.height)"
        
        NetworkManager.shared.fetchImage(from: cat.url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.catImage?.image = UIImage(data: imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}
