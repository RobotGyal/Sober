//
//  CustomCollectionViewCell.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit
import Foundation

class CustomCollectionViewCell: UICollectionViewCell {
    public static var cellIdentifier = "cell"
    
    lazy var habitImage: UIImageView = {
        let habitImage = UIImageView(frame: .zero)
//        habitImage.backgroundColor = .orange
        habitImage.translatesAutoresizingMaskIntoConstraints = false
        habitImage.layer.cornerRadius = 10
        habitImage.contentMode = .scaleAspectFit
        return habitImage
    }()
    
    func habitImageConstraints() {
        NSLayoutConstraint.activate([
            habitImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            habitImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            habitImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            habitImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(habitImage)
        habitImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    
    
    
    func setUI(object image: UIImage) {
        habitImage.image = image
    }
    
    
    
    
}
