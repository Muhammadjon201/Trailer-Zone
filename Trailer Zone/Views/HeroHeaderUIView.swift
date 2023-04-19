//
//  HeroHeaderUIView.swift
//  Trailer Zone
//
//  Created by ericzero on 4/19/23.
//

import UIKit

class HeroHeaderUIView: UIView {

    lazy var heroImgView: UIImageView = {
        let heroImgView = UIImageView()
        heroImgView.contentMode = .scaleAspectFill
        heroImgView.clipsToBounds = true
        heroImgView.image = UIImage(named: "Cat")
        return heroImgView
    }()
    
    lazy var playBtn: UIButton = {
        let playBtn = UIButton()
        playBtn.setTitle("Play", for: .normal)
        playBtn.layer.borderWidth = 1
        return playBtn
    }()
    
    lazy var downloadBtn: UIButton = {
        let downloadBtn = UIButton()
        downloadBtn.setTitle("Download", for: .normal)
        downloadBtn.layer.borderWidth = 1
        return downloadBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImgView)
        addGradient()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImgView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor, UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    func setConstraints(){
        addSubview(playBtn)
        addSubview(downloadBtn)
    }
    
    func configure(with model: TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(String(describing: model.posterURL))") else { return }

        heroImgView.sd_setImage(with: url, completed: nil)
    }

}
