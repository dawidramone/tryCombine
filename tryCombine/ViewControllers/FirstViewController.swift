import UIKit
import Combine
import PureLayout

class FirstViewController: UIViewController {
    @Published private var switchValuePublished: Bool = false
    private var switchSubscriber: AnyCancellable?

    var coordinator: MainCoordinator?

    private let barButton = BarButtonItem()
    private let switchButon: UISwitch = UISwitch()
    private let switchMeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Gen.enabledNextButton.rawValue

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = self.barButton
        self.addTargets()
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
            self.switchValuePublished = switchValue
        }
    }

    fileprivate func bind() {
        self.switchSubscriber = self.$switchValuePublished
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: self.barButton)
    }

    @objc fileprivate func pushSecondViewController(_ sender: UIBarButtonItem) { //TODO: add coordinator for handle navigate
        self.coordinator?.navigateToSecondViewController()
    }

    fileprivate func addTargets() {
        self.switchButon.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        self.barButton.target = self
        self.barButton.action = #selector(self.pushSecondViewController(_:))
    }
}

