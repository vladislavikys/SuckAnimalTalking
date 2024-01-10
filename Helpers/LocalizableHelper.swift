//
//  LocalizableHelper.swift
//  SuckAnimalTalking
//
//  Created by Влад on 10.01.24.
//

import Foundation


public extension String{
    var localizable: String{
        return NSLocalizedString(self, comment: "")
    }
}
///Этот код расширяет тип String с помощью вычисляемого свойства localizable. Он используется для локализации строковых значений.
///Метод NSLocalizedString используется для поиска соответствующих локализованных строк в файле Localizable.strings по ключу строки (self). Если локализованная строка не найдена, возвращается исходная строка. comment используется для пояснения строки при локализации.

///Таким образом, это позволяет использовать краткую и лаконичную форму для локализации строк, добавляя .localizable к строке, которую вы хотите локализовать.
