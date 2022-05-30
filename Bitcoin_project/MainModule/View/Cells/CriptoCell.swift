//
//  CriptoCell.swift
//  Bitcoin_project
//
//  Created by Sinuhé Ruedas on 27/05/22.
//

import Foundation
import UIKit

final class CriptoCell: UITableViewCell {
    var title: UILabel
    var uiImageView: UIImageView
    static let criptoIdentifier: String = String(describing: CriptoCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.title = UILabel()
        self.uiImageView = UIImageView()
        super.init(style: .default, reuseIdentifier: Constants.cellIdentifier)
        setTitle()
        setImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -88),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        title.backgroundColor = .clear
        title.numberOfLines = Int.zero
    }
    
    private func setImage() {
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(uiImageView)
        NSLayoutConstraint.activate([
            uiImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            uiImageView.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 4),
            uiImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            uiImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            uiImageView.heightAnchor.constraint(equalToConstant: 92)
        ])
        uiImageView.image = UIImage(named: Constants.catalinaImageName)
        uiImageView.contentMode = .scaleAspectFill
    }
}
