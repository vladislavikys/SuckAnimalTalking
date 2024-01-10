//
//  TestCollectionView.swift
//  SuckAnimalTalking
//
//  Created by Влад on 10.01.24.
//

import UIKit
import SnapKit
import Foundation

// Ячейка для отображения изображений питомцев в коллекции
final class TestCollectionCell: UIBaseCollectionViewCell {
    private var petsImage: UIImageView! // Изображение питомца
    
    override func configUI() {
        super.configUI()
        self.clipsToBounds = false // Отключение обрезания границ для элемента
        self.backgroundColor = .clear // Прозрачный фон ячейки
        
        petsImage = UIImageView() // Инициализация изображения питомца
        petsImage.contentMode = .scaleAspectFill // Режим отображения изображения, чтобы оно заполняло свою область, сохраняя пропорции
        petsImage.clipsToBounds = true // Обрезать изображение по границам вью
        petsImage.layer.borderColor = UIColor.white.cgColor // Цвет рамки изображения
        petsImage.layer.borderWidth = 1 // Толщина рамки изображения
        
        // Добавление тени
        self.addDefaultShadow(opacity: 0.5, shadowRadius: 7,
                              shadowColor: UIColor(red: 0.506, green: 0.173, blue: 0.192, alpha: 1).cgColor,
                              shadowOffset: CGSize(width: 3, height: 3))
    }
    
    override func setupLayout() {
        super.setupLayout()
        self.addSubview(petsImage) // Добавление изображения в ячейку
        
        // Установка ограничений для изображения
        petsImage.snp.makeConstraints { make in
            make.edges.equalToSuperview() // Заполнение всей доступной области ячейки изображением
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Закругление углов ячейки и изображения внутри нее для создания круглой формы
        self.layer.cornerRadius = self.bounds.height / 2
        self.petsImage.layer.cornerRadius = self.bounds.height / 2
    }
    
    // Установка данных (изображения питомца) в ячейку
    public func setData(data: MainPetsDataModel.PetsData) {
        self.petsImage.image = UIImage(named: data.imageName) // Установка изображения питомца в UIImageView
    }
}

