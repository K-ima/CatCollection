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

    func configure(with cat: Cat) {
//        sizeImageLabel.text = "Разрешение \(cat.width)х\(cat.height)"
        sizeImageLabel.text = String(cat.width)
        
        NetworkManager.shared.fetchImage(from: cat.url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.catImage?.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
