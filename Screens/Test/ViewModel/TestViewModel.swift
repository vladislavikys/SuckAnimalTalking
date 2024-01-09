import Foundation



final class TestViewModel{
    var coordinator:TestCoordinatorDelegate
    init(coordinator: TestCoordinatorDelegate) {
        self.coordinator = coordinator
    }
    
}
