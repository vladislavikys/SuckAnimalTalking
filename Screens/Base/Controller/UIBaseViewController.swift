//
//  UIBaseViewController.swift
//  SuckAnimalTalking
//
//  Created by Влад on 10.01.24.
//

import UIKit

class UIBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        configUI()
        
    }
    
     func configUI() {
        // Настройка градиента фона для представления
        self.view.addGradient(colors: [
            UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor, // Белый
            UIColor(red: 0.92, green: 0.938, blue: 0.975, alpha: 1).cgColor, // Серый
            UIColor(red: 0.918, green: 0.937, blue: 0.974, alpha: 1).cgColor // Еще один серый оттенок
        ],
                              locations: [0, 0.91, 1]) // Настройка положения цветов в градиенте
        
    }

    // Установка макета интерфейса
    public func setupLayout() {
        
    }


    // Привязка обработчиков событий
    // Связывание действий для навигационных кнопок
    public func bind() {
        
        }
   

}
