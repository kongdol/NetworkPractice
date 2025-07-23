//
//  ballLabel.swift
//  NetworkPractice
//
//  Created by yk on 7/24/25.
//

import UIKit

class BallLabel: UILabel {
    
    // 코드
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.frame.size.width = 30
//        self.frame.size.height = 30
        
        // 중복값제외, 번호조건문색깔
        
        self.textColor = .white
        self.backgroundColor = .blue
        self.textAlignment = .center
        
        // self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.layer.cornerRadius = 10
        
        self.clipsToBounds = true
        
        layoutSubviews()
        
    }
    
    
    
    // 스토리보드
    required init?(coder: NSCoder) {
        fatalError("스토리보드에러")
    }
}
