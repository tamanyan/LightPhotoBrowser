//
//  LightPhotoAssetManager.swift
//  LightPhotoBrowser
//
//  Created by svpcadmin on 4/6/17.
//  Copyright © 2017 tamanyan. All rights reserved.
//

import UIKit

class LightPhotoAssetManager {
    static func image(_ named: String) -> UIImage? {
        let bundle = Bundle(for: LightPhotoAssetManager.self)
        return UIImage(named: "LightPhotoBrowser.bundle/\(named)", in: bundle, compatibleWith: nil)
    }
}
