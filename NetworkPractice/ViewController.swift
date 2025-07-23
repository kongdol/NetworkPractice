//
//  ViewController.swift
//  NetworkPractice
//
//  Created by yk on 7/24/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var movieButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieButton.addTarget(self, action: #selector(movieButtonTapped), for: .touchUpInside)
    }
    
    @objc func movieButtonTapped() {
        
        print("무비버튼")
        let vc = MovieViewController()
        present(vc, animated: true)
    }

    @IBAction func lottoButtonTapped(_ sender: UIButton) {
        let vc = LottoViewController()
        present(vc, animated: true)
        print("로또버튼")
    }
    
}

