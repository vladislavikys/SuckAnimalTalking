import UIKit
extension UIView {
    func addGradient(
        colors: [CGColor],
        startPoint: CGPoint = CGPoint(x: 0, y: 0),
        endPoint: CGPoint = CGPoint(x: 0, y: 0),
        locations: [NSNumber]? = nil
    ) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds // Устанавливает рамку градиента такой же, как и размеры и положение объекта, к которому он применяется.
        gradient.colors = colors
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.locations = locations
        gradient.cornerRadius = self.layer.cornerRadius
        
        self.layer.insertSublayer(gradient, at: 0) // Добавляет новый слой (gradient) в начало списка слоёв текущего объекта (self.layer).
    }
}
