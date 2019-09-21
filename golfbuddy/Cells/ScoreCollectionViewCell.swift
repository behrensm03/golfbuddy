//
//  ScoreCollectionViewCell.swift
//  golfbuddy
//
//  Created by Michael Behrens on 8/13/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import UIKit

class ScoreCollectionViewCell: UICollectionViewCell {
    
    var courseLabel: UILabel!
    var strokesLabel: UILabel!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 5.0
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 3.0, height: 5.0)
        contentView.layer.shadowRadius = 2.0
        contentView.layer.shadowOpacity = 1.0
        contentView.layer.masksToBounds = false
        
        
        courseLabel = UILabel()
        courseLabel.translatesAutoresizingMaskIntoConstraints = false
        courseLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        courseLabel.textColor = .white
        courseLabel.textAlignment = .center
        contentView.addSubview(courseLabel)
        
        
        strokesLabel = UILabel()
        strokesLabel.translatesAutoresizingMaskIntoConstraints = false
        strokesLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        strokesLabel.textColor = .white
        strokesLabel.textAlignment = .right
        contentView.addSubview(strokesLabel)
        
        
        
        
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            courseLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            courseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            courseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            courseLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            strokesLabel.topAnchor.constraint(equalTo: courseLabel.bottomAnchor),
            strokesLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            strokesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            strokesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
    
    
    
    func configure(for score: Score) {
        courseLabel.text = score.course
        strokesLabel.text = String(score.total)
        
        let x = score.course.split(separator: " ")
        var firstChars = [Substring]()
        for y in x {
            let first = y.prefix(upTo: y.index(after: y.startIndex))
            firstChars.append(first)
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
