//
//  ViewController.swift
//  tryCombine
//
//  Created by Dawid Ramone on 15/10/2019.
//  Copyright © 2019 Dawid Ramone. All rights reserved.
//

import UIKit
import Combine
import PureLayout

class ViewController: UIViewController {
    private var buttonSwitchValue: Bool = false
    private var switchSubscriber: AnyCancellable?

    private let barButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        let largeConfig = UIImage.SymbolConfiguration(weight: .bold)
        let systemImage = UIImage(
            systemName: "chevron.right",
            withConfiguration: largeConfig
        )

        button.image = systemImage
        button.tintColor = .black

        return button
    }()

    private let switchButon: UISwitch = UISwitch()
    private let switchMeLabel: UILabel = {
        let label = UILabel()
        label.text = "switch me"

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = self.barButton
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.addSubviews()
        self.addConstraints()
    }

    fileprivate func addSubviews() {
        self.view.addSubview(self.switchMeLabel)
        self.view.addSubview(self.switchButon)
    }

    fileprivate func addConstraints() {
        self.switchMeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
        self.switchMeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        self.switchButon.autoPinEdge(.left, to: .right, of: self.switchMeLabel, withOffset: 11)
        self.switchButon.autoAlignAxis(.horizontal, toSameAxisOf: self.switchMeLabel)
    }
}

