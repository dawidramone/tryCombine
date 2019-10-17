import UIKit

class SecondViewController: UIViewController {
    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }

    deinit {
        print("Second VC deinit")
    }

}
