//
//  HeaderView.swift
//  LightPhotoBrowser
//
//  Created by svpcadmin on 4/6/17.
//  Copyright © 2017 tamanyan. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate: class {
    func headerView(_ headerView: HeaderView, didPressDeleteButton deleteButton: UIButton)
    func headerView(_ headerView: HeaderView, didPressCloseButton closeButton: UIButton)
}

open class HeaderView: UIView {
    var centerTextStyle: NSMutableParagraphStyle = {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
    }()

    open fileprivate(set) lazy var closeButton: UIButton = { [unowned self] in
        let button = UIButton(type: .system)

        button.frame.size = LightPhotoConfig.CloseButton.size
        button.addTarget(self, action: #selector(closeButtonDidPress(_:)),
                         for: .touchUpInside)

        if let image = LightPhotoConfig.CloseButton.image {
            button.setImage(image, for: UIControlState())
            button.tintColor = .white
        }

        button.isHidden = !LightPhotoConfig.CloseButton.enabled

        return button
        }()

    open fileprivate(set) lazy var deleteButton: UIButton = { [unowned self] in
        let title = NSAttributedString(
            string: LightPhotoConfig.DeleteButton.text,
            attributes: LightPhotoConfig.DeleteButton.textAttributes)

        let button = UIButton(type: .system)

        button.frame.size = LightPhotoConfig.DeleteButton.size
        button.setAttributedTitle(title, for: .normal)
        button.addTarget(self, action: #selector(deleteButtonDidPress(_:)),
                         for: .touchUpInside)

        if let image = LightPhotoConfig.DeleteButton.image {
            button.setBackgroundImage(image, for: UIControlState())
        }

        button.isHidden = !LightPhotoConfig.DeleteButton.enabled

        return button
        }()

    weak var delegate: HeaderViewDelegate?

    // MARK: - Initializers

    public init() {
        super.init(frame: CGRect.zero)

        backgroundColor = UIColor.clear

        [closeButton, deleteButton].forEach { addSubview($0) }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    func deleteButtonDidPress(_ button: UIButton) {
        delegate?.headerView(self, didPressDeleteButton: button)
    }

    func closeButtonDidPress(_ button: UIButton) {
        delegate?.headerView(self, didPressCloseButton: button)
    }
}

// MARK: - LayoutConfigurable

extension HeaderView: LayoutConfigurable {

    public func configureLayout() {
        closeButton.frame.origin = CGPoint(
            x: 0, y: 0)

        deleteButton.frame.origin = CGPoint(x: 17, y: 0)
    }
}
