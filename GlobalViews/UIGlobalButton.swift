//
//  UIGlobalButton.swift
//  SuckAnimalTalking
//
//  Created by Влад on 10.01.24.
//

import UIKit
import SnapKit
import Foundation

// Перечисление для позиций кнопки
extension UIGlobalButton {
    enum Position {
        // Определение центральной позиции кнопки с возможностью настройки внутренних отступов
        case center(edges: UIEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
    }
}

// Кнопка, наследующая UIBaseView
 class UIGlobalButton: UIBaseView {
    private var titleLabel: UILabel!
    private var imageView: UIImageView!
    private var position: UIGlobalButton.Position // Позиция кнопки
    private var stackView: UIStackView!
    
    // Инициализатор кнопки с заданной позицией
    init(position: UIGlobalButton.Position = .center()) {
        self.position = position
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Настройка внешнего вида кнопки
    public override func configUI() {
        super.configUI()
        
        self.backgroundColor = .clear
        
        stackView = UIStackView()
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.clipsToBounds = true
        
        titleLabel = UILabel()
        titleLabel.adjustsFontSizeToFitWidth = true  // Текст подстраивается под размер кнопки
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        self.isUserInteractionEnabled = true
    }
    
    // Настройка разметки кнопки
    public override func setupLayout() {
        super.setupLayout()
        self.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        
        stackView.snp.makeConstraints { make in
            switch position {
            case .center(let edges):
                make.top.equalToSuperview().offset(edges.top)
                make.leading.equalToSuperview().offset(edges.left)
                make.trailing.equalToSuperview().inset(edges.right)
                make.bottom.equalToSuperview().inset(edges.bottom)
            }
        }
    }
    
    // Округление углов кнопки
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height / 2
    }
}

