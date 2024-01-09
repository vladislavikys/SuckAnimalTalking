import UIKit
import Foundation

protocol Coordinator{
    var navigationController: UINavigationController { get set }
    func start(with params: [CoordinatorDataSourceKey: Any]?) // Эта функция запускает координатор с переданными параметрами, если они есть
    func back()
    func backToRoot()
}
extension Coordinator{
    func back(){
        self.navigationController.popViewController(animated: true)   // используется для возвращения на предыдущий экран в стеке контроллеров.
    }
    func backToRoot(){
        self.navigationController.popToRootViewController(animated: true)  //  используется для возвращения на корневой экран в стеке контроллеров
    }
}


 class AppCoordinator{
     var navigationController: UINavigationController
     
     init(navigationController: UINavigationController) {
         self.navigationController = navigationController
     }
     
    func start(with params: [CoordinatorDataSourceKey : Any]?) {
        let testCoord = TestCoordinator(navigationController: navigationController)
        testCoord.start(with: nil  )
    }
}
//Эта функция создает экземпляр класса AppCoordinator и запускает поток приложения, используя переданный UINavigationController в качестве навигационного контроллера. Если переданный UINavigationController равен nil, функция возвращает nil.
//Эта функция предназначена для инициализации и запуска координатора приложения, который управляет навигацией и потоком работы приложения. Приложение может использовать эту функцию для создания экземпляра AppCoordinator и запуска основного потока работы приложения.
extension AppCoordinator{
    static func createInstanceAndStartAppFlow(navigation: UINavigationController?) -> AppCoordinator?{
        guard let navigation = navigation else {return nil}
        let coordinator: AppCoordinator = AppCoordinator(navigationController: navigation)
        coordinator.start(with: nil)
        return coordinator
    }
}

