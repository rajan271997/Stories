//
//  ViewController.swift
//  Stories
//
//  Created by Rajan Arora on 30/05/21.
//

import UIKit

class StoriesViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet var viewCollection: UICollectionView!
    
    // MARK: Class Members
    var savedIndexes = Set<Int>()
    
    // MARK: UIViewController Delegate  Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNibs()
    }
    
    // MARK: Helper Methods
    func registerNibs() {
        viewCollection.register(UINib(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoryCollectionViewCell")
    }
    
}

// MARK: UICollectionViewDataSource Methods

extension StoriesViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        savedIndexes.contains(indexPath.row) ? (cell.setupCell(isVisible: true,image: UIImage(named: "stylish\(indexPath.row + 1)"))) : (cell.setupCell(isVisible: false,image: UIImage(named: "stylish\(indexPath.row + 1)")))
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout Methods

extension StoriesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

// MARK: UICollectionViewDelegate Methods

extension StoriesViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? StoryCollectionViewCell else {
            return
        }
        
        if (savedIndexes.contains(indexPath.row)) {
            return
        }
        
        savedIndexes.insert(indexPath.row)
        cell.showAnimation()
    }
}

