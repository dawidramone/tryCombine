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
    @Published private var buttonSwitchValue: Bool = false
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
        button.isEnabled = false

        return button
    }()

    private let switchButon: UISwitch = UISwitch()
    private let switchMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Enabled next button"

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = self.barButton
        switchButon.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        self.addSubviews()
        self.addConstraints()
        self.bind()
    }

    fileprivate func addSubviews() {
        self.view.addSubview(self.switchMeLabel)
        self.view.addSubview(self.switchButon)
    }

    fileprivate func addConstraints() {
        self.switchMeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 102)
        self.switchMeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        self.switchButon.autoPinEdge(.left, to: .right, of: self.switchMeLabel, withOffset: 12)
        self.switchButon.autoAlignAxis(.horizontal, toSameAxisOf: self.switchMeLabel)
    }

    @objc fileprivate func switchStateDidChange(_ sender: UISwitch) {
        let switchValue = sender.isOn
        DispatchQueue.global().async {
            self.buttonSwitchValue = switchValue
        }
    }

    fileprivate func bind() {
        /* init @Published in two ways
         self.switchSubscriber = self.$buttonSwitchValue.sink { [weak self] isEnabled in
            DispatchQueue.main.async {
                self.barButton.isEnabled = isEnabled
            }
         }
        */
        self.switchSubscriber = self.$buttonSwitchValue
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: barButton)
    }
}

