//
//  ViewController.swift
//  ImageDownloadProject
//
//  Created by dasol lee on 2023/03/03.
//

import UIKit

struct ImageItem {
    let imageURL: String
}


class ViewController: UIViewController {
    private static let cellIdentifier = "imageLoaderCell"
    private let tableView = UITableView()
    private var imageItems = [ImageItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        initDumyData()
    }

    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ImageLoadCell.self, forCellReuseIdentifier: ViewController.cellIdentifier)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellIdentifier, for: indexPath) as? ImageLoadCell else {
            return UITableViewCell()
        }
        
        let imageItem = imageItems[indexPath.row]
        cell.imageItem = imageItem
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}


// MARK: - initDumyData
extension ViewController {
    private func initDumyData() {
        imageItems.append(ImageItem(imageURL: "https://www.apple.com/newsroom/images/product/os/ios/standard/Apple_iphone11_ios14-springboard-widgets_09162020_inline.jpg.large.jpg"))
        imageItems.append(ImageItem(imageURL: "https://www.apple.com/newsroom/images/product/os/ios/standard/Apple_iphone11_ios14-safari-incomingcall_09162020_carousel.jpg.large.jpg"))
        imageItems.append(ImageItem(imageURL: "https://www.apple.com/newsroom/images/product/os/ios/standard/Apple_iphone11_ios14-appclips-parkwhiz_09162020_carousel.jpg.large.jpg"))
        imageItems.append(ImageItem(imageURL: "https://www.apple.com/newsroom/images/product/os/ios/standard/Apple_iphone11_ios14-messages-pinned-conversations_09162020_carousel.jpg.large.jpg"))
        imageItems.append(ImageItem(imageURL: "https://www.apple.com/newsroom/images/product/os/ios/standard/Apple_iphone11_ios14-maps-cycle-route_09162020_carousel.jpg.large.jpg"))
        imageItems.append(ImageItem(imageURL: "https://www.apple.com/newsroom/images/product/os/ios/standard/Apple_iphone11_ios14-app-privacy_09162020_inline.jpg.large.jpg"))
        imageItems.append(ImageItem(imageURL: "https://www.apple.com/newsroom/images/product/os/ios/standard/Apple_iphone11_ios14-airpods-connection-ipadpro-airpods-pro_09162020_big.jpg.large.jpg"))
        
        tableView.reloadData()
    }
}
