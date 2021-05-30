//
//  StoryCollectionViewCell.swift
//  Stories
//
//  Created by Rajan Arora on 30/05/21.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet var viewSuper: ProgressBar!
    @IBOutlet var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Helper Methods
    func setupCell(isVisible : Bool,image : UIImage?) {
        let helper = Helper()
        
        helper.roundViews(radius: imageView.bounds.size.height / 2.0, view: imageView)
        
        isVisible ? (viewSuper.progressLayer.strokeEnd = 1) : (viewSuper.progressLayer.strokeEnd = 0)
        
        viewSuper.layoutSublayers(of: viewSuper.progressLayer)
        
        imageView.image = image
    }
    
    func showAnimation() {
        viewSuper.showAnimation()
    }
    
}
