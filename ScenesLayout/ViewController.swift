//
//  ViewController.swift
//  ScenesLayout
//
//  Created by kariman eltawel on 22/05/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let images : [UIImage] = Array(1 ... 26).map { UIImage(named: String($0))! }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = compositionLayout()

    }
    func compositionLayout() -> UICollectionViewCompositionalLayout{
        //item
    
        let firstImage = compoitionalLayout.createItem(itemWidth: .fractionalWidth(1), itemHeight: .absolute(200),itemSpacing: 5)
        //first group
        //group 1---image--group
        let bigImageGroup = compoitionalLayout.createItem(itemWidth: .fractionalWidth(0.67), itemHeight: .fractionalHeight(1),itemSpacing: 5)
        
        let smallImageVertical = compoitionalLayout.createItem(itemWidth: .fractionalWidth(1), itemHeight: .fractionalHeight(1),itemSpacing: 5)
        
        let verticalImageGroup = compoitionalLayout.createGroupWithItem(alignment: .vertical, groupWidth: .fractionalWidth(0.33), groupHeight: .fractionalHeight(1), item: smallImageVertical, count: 2)
        
        let verticalGroup = compoitionalLayout.createGroupWithItems(alignment: .horizontal, groupWidth:.fractionalWidth(1) , groupHeight: .fractionalHeight(0.7), items: [bigImageGroup,verticalImageGroup])
        
        let horizontalGroup = compoitionalLayout.createGroupWithItem(alignment: .horizontal, groupWidth: .fractionalWidth(1), groupHeight: .fractionalHeight(0.3), item: smallImageVertical, count: 3)
        
        let firstGroup = compoitionalLayout.createGroupWithItems(alignment: .vertical, groupWidth:.fractionalWidth(1) , groupHeight: .absolute(400), items: [verticalGroup,horizontalGroup])
        
        
        //second group
        let verticalGroupSecond = compoitionalLayout.createGroupWithItems(alignment: .horizontal, groupWidth:.fractionalWidth(1) , groupHeight: .fractionalHeight(0.7), items: [verticalImageGroup,bigImageGroup])
        
        
        
        let verticalGroupForSecond = compoitionalLayout.createGroupWithItems(alignment: .horizontal, groupWidth:.fractionalWidth(1) , groupHeight: .fractionalHeight(0.7), items: [verticalImageGroup,bigImageGroup])
        
        let secondGroup = compoitionalLayout.createGroupWithItems(alignment: .vertical, groupWidth:.fractionalWidth(1) , groupHeight: .absolute(400), items: [verticalGroupForSecond,horizontalGroup])
        
        // group
        
        let  group = compoitionalLayout.createGroupWithItems(alignment: .vertical, groupWidth: .fractionalWidth(1), groupHeight:.absolute(1000), items: [firstImage,firstGroup,secondGroup])
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }


}
extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SceneCell", for: indexPath) as! SceneCell
        cell.setup(image: images[indexPath.row])
        return cell
    }
    
    
}



