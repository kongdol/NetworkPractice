//
//  MovieTableViewCell.swift
//  NetworkPractice
//
//  Created by yk on 7/24/25.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    
    let numLabel = UILabel()
    let titleLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    let dateLabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    // 스토리보드
    required init?(coder: NSCoder) {
        fatalError("오류")
    }
}

extension MovieTableViewCell: ViewDesignProtocol {
    func configureHierarchy() {
        contentView.addSubview(numLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
    }
    
    func configureLayout() {
        numLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView.snp.leading).offset(8)
            make.width.equalTo(40)
            make.height.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(numLabel.snp.trailing).offset(16)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
    }
    
    func configureView() {
        numLabel.textColor = .black
        numLabel.backgroundColor = .white
        numLabel.textAlignment = .center
        numLabel.font = .boldSystemFont(ofSize: 16)
    }
    
    
}


