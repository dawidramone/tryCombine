import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = FirstViewController()
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: false)
    }

    func navigateToSecondViewController() {
        let secondViewController = SecondViewController()
        secondViewController.coordinator = self
        self.navigationController.pushViewController(secondViewController, animated: true)
    }
}
