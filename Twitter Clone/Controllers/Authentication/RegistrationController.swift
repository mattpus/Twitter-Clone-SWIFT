//
//  RegistrationController.swift
//  Twitter Clone
//
//  Created by Pusiewicz, M. (Mateusz) on 02/12/2022.
//

import UIKit


class RegistrationController: UIViewController {
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true

    }
}
