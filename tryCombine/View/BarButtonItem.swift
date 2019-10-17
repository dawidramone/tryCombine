import UIKit

class BarButtonItem: UIBarButtonItem {
    let largeConfig = UIImage.SymbolConfiguration(weight: .bold)
    lazy var systemImage = UIImage(
        systemName: Constants.AppIconName.chevronRight.rawValue,
        withConfiguration: largeConfig
    )

    override init() {
        super.init()
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError(Constants.ErrorMessage.initNotImplemented.rawValue)
    }

    fileprivate func setup() {
        self.image = self.systemImage
        self.tintColor = .black
        self.isEnabled = false
    }
}

class LeftBarButtonItem: UIBarButtonItem {
    let largeConfig = UIImage.SymbolConfiguration(weight: .bold)
    lazy var systemImage = UIImage(
        systemName: Constants.AppIconName.chevronLeft.rawValue,
        withConfiguration: largeConfig
    )

    override init() {
        super.init()
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError(Constants.ErrorMessage.initNotImplemented.rawValue)
    }

    fileprivate func setup() {
        self.image = self.systemImage
        self.tintColor = .black
    }
}
