//
//  LottoViewController.swift
//  NetworkPractice
//
//  Created by yk on 7/24/25.
//

import UIKit
import SnapKit

class LottoViewController: UIViewController {
    
    lazy var stackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    let textField = UITextField()
    
    let infoLabel = UILabel()
    
    let dateLabel = UILabel()
    
    let line = setLine()
    
    let resultLabel = UILabel()
    
    let oneBall = {
        let ballLabel = BallLabel()
        
        ballLabel.text = "\(Int.random(in: 1...50))"
        
        
        return ballLabel
    }()
    
    let twoBall = {
        let ballLabel = BallLabel()
        
        ballLabel.text = "\(Int.random(in: 1...50))"
        
        return ballLabel
    }()
    
    let threeBall = {
        let ballLabel = BallLabel()
        ballLabel.text = "\(Int.random(in: 1...50))"
        return ballLabel
    }()
    
    let fourBall = {
        let ballLabel = BallLabel()
        ballLabel.text = "\(Int.random(in: 1...50))"
        return ballLabel
    }()
    
    let fiveBall = {
        let ballLabel = BallLabel()
        ballLabel.text = "\(Int.random(in: 1...50))"
        return ballLabel
    }()
    
    let sixBall = {
        let ballLabel = BallLabel()
        ballLabel.text = "\(Int.random(in: 1...50))"
        return ballLabel
    }()
    
    let plusLabel = UILabel()
    
    let bonusBall = {
        let ballLabel = BallLabel()
        ballLabel.text = "\(Int.random(in: 1...50))"
        return ballLabel
    }()
    
    let bonusLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()

        view.backgroundColor = .white
    }
}

extension LottoViewController {
    @objc static func setLine() -> UIView {
        let a = UIView()
        
        return a
    }
}

extension LottoViewController: ViewDesignProtocol {
    func configureHierarchy() {
        
        view.addSubview(stackView)
        view.addSubview(line)
        // addSubView
        [textField,infoLabel,dateLabel,resultLabel,plusLabel,bonusLabel].forEach { view.addSubview($0) }
        [oneBall,twoBall,threeBall,fourBall,fiveBall,sixBall,plusLabel,bonusBall].forEach { stackView.addArrangedSubview($0)}
        
        // [oneBall,twoBall,threeBall,fourBall,fiveBall,sixBall,bonusBall].forEach { view.addSubview($0) }
        
    }
    
    func configureLayout() {
        // constaint
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(32)
            make.leading.equalTo(view.snp.leading).offset(16)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(32)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(8)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        
        
//        oneBall.snp.makeConstraints { make in
//            make.top.equalTo(resultLabel.snp.bottom).offset(32)
//            make.
//        }
        
    }
    
    func configureView() {
        // like color
        textField.textAlignment = .center
        //textField.backgroundColor = .blue
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.borderStyle = .line
        
        infoLabel.text = "당첨번호 안내"
        
        dateLabel.text = "2020-05-30 추첨"
        dateLabel.textColor = .lightGray
        dateLabel.font = .systemFont(ofSize: 11)
            
        line.backgroundColor = .lightGray
        
        resultLabel.text = "999회 당첨결과"
        resultLabel.font = .boldSystemFont(ofSize: 18)
        
        stackView.backgroundColor = .yellow
     
        plusLabel.text = "+"
        plusLabel.textAlignment = .center
        
        bonusLabel.text = "보너스"
        
    }
    

    
}
