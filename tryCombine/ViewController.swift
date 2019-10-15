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
    private let barButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        let largeConfig = UIImage.SymbolConfiguration(weight: .bold)
        let systemImage = UIImage(
            systemName: "chevron.right",
            withConfiguration: largeConfig
        )

        button.image = systemImage
        button.tintColor = .gray

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = self.barButton

    }


}

