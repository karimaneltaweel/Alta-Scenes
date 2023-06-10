//
//  SceneCell.swift
//  ScenesLayout
//
//  Created by kariman eltawel on 22/05/2023.
//

import UIKit

class SceneCell: UICollectionViewCell {
    
    @IBOutlet weak var sceneImage: UIImageView!
    func setup(image:UIImage){
        self.sceneImage.image = image
    }
}
