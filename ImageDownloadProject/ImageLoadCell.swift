//
//  ImageLoadCell.swift
//  ImageDownloadProject
//
//  Created by dasol lee on 2023/03/03.
//

import UIKit

class ImageLoadCell: UITableViewCell {
    var thumnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    var progressBar: UIProgressView = {
        let progress = UIProgressView()
        
        return progress
    }()
    var downloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 5
        return button
    }()
    
    var imageItem: ImageItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }
    
    private func reset() {
        self.progressBar.progress = 0
        self.thumnailImageView.image = UIImage(systemName: "photo")
    }
    
    private func setupUI() {
        thumnailImageView.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(thumnailImageView)
        contentView.addSubview(progressBar)
        contentView.addSubview(downloadButton)
        
        NSLayoutConstraint.activate([
            thumnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            thumnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            thumnailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            thumnailImageView.widthAnchor.constraint(equalToConstant: 100),
            thumnailImageView.heightAnchor.constraint(equalToConstant: 100),
            progressBar.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 15),
            progressBar.trailingAnchor.constraint(equalTo: downloadButton.leadingAnchor, constant: -16),
            progressBar.centerYAnchor.constraint(equalTo: thumnailImageView.centerYAnchor),
            downloadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            downloadButton.centerYAnchor.constraint(equalTo: progressBar.centerYAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 80),
            downloadButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])
        
        downloadButton.addTarget(self, action: #selector(didImageDownloadButton(_:)), for: .touchUpInside)
    }
    
    @objc func didImageDownloadButton(_ sender: UIButton) {
        reset()
        self.thumnailImageView.load(url: NSURL(string: imageItem?.imageURL ?? "")!) { [weak self] progress in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.progressBar.progress = Float(progress)
            }
        }
    }
}
