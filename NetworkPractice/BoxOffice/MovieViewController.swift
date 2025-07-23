//
//  MovieViewController.swift
//  NetworkPractice
//
//  Created by yk on 7/24/25.
//

import UIKit
import SnapKit

class MovieViewController: UIViewController {

    let textField = UITextField()
    let textLine = UIView()
    let searchButton = UIButton()
    let tableView = UITableView()
    
    var list: [Movie] = MovieInfo.movies
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        
        configureHierarchy()
        configureLayout()
        configureView()
        
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc func searchButtonTapped() {
        print("검색버튼눌렸음")
        
        // 테이블뷰리로드데이터
        let random = list.shuffled().prefix(10)
        var filter: [Movie] = Array(random)
        list = filter
        tableView.reloadData()
    }
}

extension MovieViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("텍스트필드엔터")
        
        // 테이블뷰리로드데이터
        let random = list.shuffled().prefix(10)
        var filter: [Movie] = Array(random)
        list = filter
        tableView.reloadData()
        
        return true
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(MovieInfo.movies.count)
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        
        let movie: Movie = list[indexPath.row]
        
        
        cell.numLabel.text = "\(indexPath.row + 1)"
        cell.titleLabel.text = movie.title
        cell.dateLabel.text = movie.releaseDate
        
        cell.backgroundColor = .clear
        tableView.rowHeight = 40
        
        return cell
    }
    
    
}

extension MovieViewController: ViewDesignProtocol {
    func configureHierarchy() {
        [textField, searchButton, tableView, textLine].forEach{ view.addSubview($0) }
    }

    
    func configureLayout() {
        searchButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.trailing.equalToSuperview().inset(32)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalTo(searchButton.snp.leading).offset(-8)
        }
        
        textLine.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalTo(searchButton.snp.leading).offset(-8)
            make.height.equalTo(1)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(textLine.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(32)
            make.bottom.equalToSuperview().offset(-32)
        }
    }
    
    func configureView() {
        searchButton.backgroundColor = .white
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        
        textField.backgroundColor = .clear
        
        textField.textColor = .white
        
        textLine.backgroundColor = .white
        
        tableView.backgroundColor = .clear
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    
}
