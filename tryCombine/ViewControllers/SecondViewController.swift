import UIKit

class SecondViewController: UIViewController {
    var coordinator: MainCoordinator?
    private let barButton: UIBarButtonItem = LeftBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.leftBarButtonItem = self.barButton
    }
}
