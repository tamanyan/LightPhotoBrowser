//
//  ViewController.swift
//  LightPhotoBrowserExample
//
//  Created by svpcadmin on 4/6/17.
//  Copyright © 2017 tamanyan. All rights reserved.
//

import UIKit
import LightPhotoBrowser

class ViewController: UIViewController {
    lazy var showButton: UIButton = { [unowned self] in
        let button = UIButton()
        button.addTarget(self, action: #selector(showLightbox), for: .touchUpInside)
        button.setTitle("Launch the LightPhotoBrowser", for: UIControlState())
        button.setTitleColor(UIColor(red: 3/255, green: 125/255, blue: 233/255, alpha: 1), for: UIControlState())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.frame = UIScreen.main.bounds
        button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Example"
        self.view.backgroundColor = .white
        self.view.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        self.view.addSubview(self.showButton)
    }

    func showLightbox() {
        let images = [
            LightPhotoImage(imageURL: URL(string: "https://cdn.arstechnica.net/2011/10/05/iphone4s_sample_apple-4e8c706-intro.jpg")!),
            LightPhotoImage(
                image: UIImage(named: "photo1")!,
                text: "Some very long lorem ipsum text. Some very long lorem ipsum text. Some very long lorem ipsum text. Some very long lorem ipsum text"
            ),
            LightPhotoImage(
                image: UIImage(named: "photo2")!,
                text: "",
                videoURL: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            ),
            LightPhotoImage(
                image: UIImage(named: "photo3")!,
                text: "Some very long lorem ipsum text."
            )
        ]
        
        let browser = LightPhotoBrowser(images: images)
        browser.dynamicBackground = true
        
        present(browser, animated: true, completion: nil)
    }
}
