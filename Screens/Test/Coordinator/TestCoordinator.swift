import Foundation
import UIKit

protocol TestCoordinatorDelegate{
    
}

final class TestCoordinator:Coordinator{
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with params: [CoordinatorDataSourceKey : Any]?) {
        let viewModel = TestViewModel(coordinator: self)
        let vc = TestViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}


extension TestCoordinator:TestCoordinatorDelegate{
    
}
