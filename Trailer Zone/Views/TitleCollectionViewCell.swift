//
//  TitleCollectionViewCell.swift
//  Trailer Zone
//
//  Created by ericzero on 4/19/23.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    lazy var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleToFill
        imageV.clipsToBounds = true
        imageV.layer.cornerRadius = 8
        return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageV)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageV.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else { return }
        imageV.sd_setImage(with: url, completed: nil)
    }
}

