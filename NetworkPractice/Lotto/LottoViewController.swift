//
//  LottoViewController.swift
//  NetworkPractice
//
//  Created by yk on 7/24/25.
//

import UIKit
import SnapKit
import Alamofire

// 뷰드로잉사이클
class LottoViewController: UIViewController {
    
    lazy var stackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    let numberTextField = UITextField()
    
    var lottoPickerView = UIPickerView()
    
    // 맨뒤에 최신걸로 업데이트해주기
    let numberList: [Int] = Array(1...1180).reversed()
    
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
        //만들때 초기값을 넣어서 만들수있따
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
    
    var urlLast = 1180
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
        callNumber(drwNo: urlLast)

        view.backgroundColor = .white
        
        numberTextField.delegate = self
        numberTextField.inputView = lottoPickerView
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        
    }
    
    
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // (numberList[row]) shouldReturn에 넘겨주기
        var urlLast = numberList[row]
        numberTextField.text = "\(numberList[row])회차"
        callNumber(drwNo: urlLast)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
    
}


extension LottoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        if let text = numberTextField.text  {
            print(numberTextField.text)
            // 0000회차를 넣어주면 그 회차 받아올수있게 url넘기기
            return true
        } else {
            print("텍스트필드가 비어있어요!")
            return false
        }

        
    }
}

extension LottoViewController {
    @objc static func setLine() -> UIView {
        let a = UIView()
        
        return a
    }
    
    func callNumber(drwNo: Int) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwNo)"
        
        print(urlLast)
        
        AF.request(url, method: .get).responseDecodable(of: Lotto.self){ response in
            switch response.result {
            case .success(let value):
                self.dateLabel.text = "\(value.drwNoDate)"
                self.oneBall.text = "\(value.drwtNo1)"
                self.twoBall.text = "\(value.drwtNo2)"
                self.threeBall.text = "\(value.drwtNo3)"
                self.fourBall.text = "\(value.drwtNo4)"
                self.fiveBall.text = "\(value.drwtNo5)"
                self.sixBall.text = "\(value.drwtNo6)"
                self.bonusBall.text = "\(value.bnusNo)"
                
                self.resultLabel.text = "\(value.drwNo)회 당첨결과"
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension LottoViewController: ViewDesignProtocol {
   
    
    func configureHierarchy() {
        
        view.addSubview(stackView)
        view.addSubview(line)
        // addSubView
        [numberTextField,infoLabel,dateLabel,resultLabel,plusLabel,bonusLabel].forEach { view.addSubview($0) }
        [oneBall,twoBall,threeBall,fourBall,fiveBall,sixBall,plusLabel,bonusBall].forEach { stackView.addArrangedSubview($0)}
        
        // [oneBall,twoBall,threeBall,fourBall,fiveBall,sixBall,bonusBall].forEach { view.addSubview($0) }
        
    }
    
    
    
    func configureLayout() {
        // constaint
        numberTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(32)
            make.leading.equalTo(view.snp.leading).offset(16)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(32)
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
        
    }
    
    func configureView() {
        // like color
        numberTextField.textAlignment = .center
        //textField.backgroundColor = .blue
        numberTextField.layer.borderWidth = 1.0
        numberTextField.layer.borderColor = UIColor.lightGray.cgColor
        numberTextField.borderStyle = .line
        
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
