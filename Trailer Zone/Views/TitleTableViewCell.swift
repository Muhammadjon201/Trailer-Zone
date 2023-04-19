//
//  TitleTableViewCell.swift
//  Trailer Zone
//
//  Created by ericzero on 4/19/23.
//

import UIKit
import SnapKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    private let titlePlayButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 3
        return title
    }()
    
    private let titlePosterImageV: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleToFill
        imageV.clipsToBounds = true
        imageV.layer.cornerRadius = 8
        return imageV
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(titlePlayButton)
        contentView.addSubview(titlePosterImageV)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyConstraints(){
        titlePosterImageV.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.centerY.equalTo(contentView)
            make.width.equalTo(140)
            make.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(titlePosterImageV.snp.right).offset(20)
            make.right.equalTo(titlePlayButton.snp.left).offset(-20)
            make.centerY.equalTo(contentView)
        }
        
        titlePlayButton.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(30)
        }
    }
    
    public func configure(with model: TitleViewModel) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(String(describing: model.posterURL))") else { return }
        
        titlePosterImageV.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
}
