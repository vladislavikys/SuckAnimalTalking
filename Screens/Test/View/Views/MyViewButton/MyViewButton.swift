//
//  MyViewButton.swift
//  SuckAnimalTalking
//
//  Created by Влад on 10.01.24.
//

import Foundation
import UIKit
import SnapKit

// Подкласс UIBaseView для создания пользовательской кнопки
final class MainIdentifyViewButton: UIBaseView {
    
    private var identifyButton: UIGlobalButton! // Приватная переменная для кнопки
    
    // Настройка пользовательского интерфейса для кнопки
    override func configUI() {
        super.configUI()
        self.backgroundColor = .clear // Установка прозрачного фона для кнопки
        self.clipsToBounds = false // Разрешение выхода за границы вида
        identifyButton = UIGlobalButton()
        // Инициализация кнопки
        identifyButton.backgroundColor = .green // Установка красного фона для кнопки
    }
    
    // Установка макета элементов внутри кнопки
    override func setupLayout() {
        super.setupLayout()
        self.addSubview(identifyButton) // Добавление кнопки в представление
        
        // Установка ограничений для кнопки по центру представления
        identifyButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview() // Центрирование по горизонтали и вертикали
            make.width.equalTo(120) // Установка ширины кнопки
            make.height.equalToSuperview() // Установка высоты кнопки, равной высоте представления
        }
    }
}
