//
//  PlayLottoViewController.swift
//  NetworkPractice
//
//  Created by yk on 7/25/25.
//

import UIKit
import SnapKit
import Alamofire

class PlayMovieViewController: UIViewController {
    
    let rank1 = UILabel()
    let title1 = UILabel()
    let date1 = UILabel()
    
    let rank2 = UILabel()
    let title2 = UILabel()
    let date2 = UILabel()
    
    let rank3 = UILabel()
    let title3 = UILabel()
    let date3 = UILabel()
    
    let textField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        textField.delegate = self
        
        configureHierarchy()
        configureLayout()
        configureView()
        
        callRequest(date)
        
        
    }
    
    let date: String = "20250723"
    
    func callRequest(_ date: String) {
        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=476411229c3afeaa70ee2140f0e3fdd4&targetDt=\(date)"
        
        print(url)
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: PMovie.self) { response in
                switch response.result {
                case .success(let value):
                    self.rank1.text = value.boxOfficeResult.dailyBoxOfficeList[0].rank
                    self.title1.text = value.boxOfficeResult.dailyBoxOfficeList[0].movieNm
                    self.date1.text = value.boxOfficeResult.dailyBoxOfficeList[0].openDt
                    
                    self.rank2.text = value.boxOfficeResult.dailyBoxOfficeList[1].rank
                    self.title2.text = value.boxOfficeResult.dailyBoxOfficeList[1].movieNm
                    self.date2.text = value.boxOfficeResult.dailyBoxOfficeList[1].openDt
                    
                    self.rank3.text = value.boxOfficeResult.dailyBoxOfficeList[2].rank
                    self.title3.text = value.boxOfficeResult.dailyBoxOfficeList[2].movieNm
                    self.date3.text = value.boxOfficeResult.dailyBoxOfficeList[2].openDt
                    
        
                    
                case .failure(let error):
                    print("에러", error)
                }
            }
    }
    
    
    
}

extension PlayMovieViewController: ViewDesignProtocol {
    func configureHierarchy() {
        [rank1,rank2,rank3,title1,title2,title3,date1,date2,date3].forEach{view.addSubview($0)}
        view.addSubview(textField)
    }
    
    func configureLayout() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(date3.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        
        rank1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(50)
           // make.width.equalTo(50)
        }
        
        rank2.snp.makeConstraints { make in
            make.top.equalTo(rank1.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(50)
           // make.width.equalTo(50)
            
        }
        
        rank3.snp.makeConstraints { make in
            make.top.equalTo(rank2.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(50)
           // make.width.equalTo(50)
            
        }
        
        title1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalTo(rank1.snp.trailing).offset(16)
            make.height.equalTo(50)
            //make.width.equalTo(50)
            
        }
        
        title2.snp.makeConstraints { make in
            make.top.equalTo(title1.snp.bottom).offset(32)
            make.leading.equalTo(rank2.snp.trailing).offset(16)
            make.height.equalTo(50)
            //make.width.equalTo(50)
        }
        
        title3.snp.makeConstraints { make in
            make.top.equalTo(title2.snp.bottom).offset(32)
            make.leading.equalTo(rank3.snp.trailing).offset(16)
            make.height.equalTo(50)
            //make.width.equalTo(50)
            
        }
        
        date1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalTo(title1.snp.trailing).offset(16)
            make.height.equalTo(50)
            //make.width.equalTo(50)
            
        }
        
        date2.snp.makeConstraints { make in
            make.top.equalTo(date1.snp.bottom).offset(32)
            make.leading.equalTo(title2.snp.trailing).offset(16)
            make.height.equalTo(50)
           // make.width.equalTo(50)
            
        }
        
        date3.snp.makeConstraints { make in
            make.top.equalTo(date2.snp.bottom).offset(32)
            make.leading.equalTo(title3.snp.trailing).offset(16)
            make.height.equalTo(50)
           // make.width.equalTo(50)
            
        }
        
        
        
    }
    
    func configureView() {
//        rank1.backgroundColor = .yellow
//        rank2.backgroundColor = .yellow
//        rank3.backgroundColor = .yellow
//        
//        title1.backgroundColor = .blue
//        title2.backgroundColor = .blue
//        title3.backgroundColor = .blue
//        
//        date1.backgroundColor = .green
//        date2.backgroundColor = .green
//        date3.backgroundColor = .green
        
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
    }
    
    
}

extension PlayMovieViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            let date = text
            print(date)
            callRequest(date)
            return true
        } else {
            print("텍스트 필드가 비어있어요")
            return false
        }
    }
}
