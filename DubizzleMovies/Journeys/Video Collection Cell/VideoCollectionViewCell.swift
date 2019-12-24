//
//  VideoCollectionViewCell.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var videoThumbnailImageView: UIImageView!
    static let imageRatio: CGFloat = 480 / 360
    
    // MARK: - UICollectionViewCell life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    fileprivate func setupUI() {
        self.backgroundColor = UIColor(commonColor: .offBlack).withAlphaComponent(0.2)
        self.videoThumbnailImageView.contentMode = .scaleAspectFill
    }
}

extension VideoCollectionViewCell: NibLoadableView { }

extension VideoCollectionViewCell: ReusableView { }
