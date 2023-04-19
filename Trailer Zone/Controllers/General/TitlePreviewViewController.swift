//
//  TitlePreviewViewController.swift
//  Trailer Zone
//
//  Created by ericzero on 4/19/23.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    let containerView = UIView()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "This is best movie for kids!"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureConstraints()
        view.backgroundColor = .systemBackground
        scrollView.contentSize = containerView.bounds.size
    }
    
    func configureConstraints(){
        view.addSubview(webView)
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(overviewLabel)
        containerView.addSubview(downloadButton)
        
        webView.snp.makeConstraints { make in
            make.top.equalTo(50)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(300)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(webView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.top.equalTo(overviewLabel.snp.bottom).offset(20)
            make.centerX.equalTo(containerView)
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.bottom.equalTo(containerView.snp.bottom).offset(-20)
        }
        
    }
    
    func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else { return }
        
        webView.load(URLRequest(url: url))
    }
}
