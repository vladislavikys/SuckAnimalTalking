//
//  DeviceSafeArea.swift
//  SuckAnimalTalking
//
//  Created by Влад on 10.01.24.
//
import UIKit
import Foundation

internal var currentSafeAreaInsetsOnDevice: UIEdgeInsets?{
    return (UIApplication.shared.windows.first?.rootViewController as? UINavigationController)?.topViewController?.view.safeAreaInsets
}

///Он использует UIApplication.shared.windows.first для доступа к главному окну приложения, затем извлекает его rootViewController как UINavigationController. Затем он пытается получить верхний активный ViewController (topViewController) в стеке навигации и извлекает отступы безопасной области safeAreaInsets его представления.

///Однако следует учитывать, что это внутренний (internal) код и использование такого глобального переменного состояния может привести к сложностям при отслеживании и понимании состояния приложения. Убедитесь, что вы используете его соответственно вашим требованиям и с учетом лучших практик проектирования вашего приложения.





// (UIApplication.shared.windows.first?.rootViewController as? UINavigationController) пытаюсь получить корневой контроллер представления типа UINavigationController из
// первого окна в массиве windows приложения. Оператор as? пытается привести тип rootViewController
// к UINavigationController и возвращает опциональное значение. Если приведение типа не удаётся, то возвращается nil


//  Свойство safeAreaInsets возвращает отступы от краев экрана, которые не перекрываются системными элементами по типу брови или кнопки назад(круглой)
