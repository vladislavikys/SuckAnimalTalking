//
//  UIBaseCollectionViewCell.swift
//  SuckAnimalTalking
//
//  Created by Влад on 10.01.24.
//

import UIKit
import Foundation


public class UIBaseCollectionViewCell: UICollectionViewCell {
    
    // Инициализатор класса, выполняющий настройку интерфейса и разметку
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        setupLayout()
    }
    
    // Реализация требуемого инициализатора, не используется
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Метод для настройки пользовательского интерфейса
    public func configUI() {
        // Реализация настройки интерфейса
        // Вы можете добавить конфигурацию элементов пользовательского интерфейса здесь
    }
    
    // Метод для установки разметки элементов интерфейса на экране
    public func setupLayout() {
        // Реализация размещения элементов на экране
        // Вы можете определить макет элементов интерфейса здесь
    }
    
 
    
    
   
    
    
    
}
