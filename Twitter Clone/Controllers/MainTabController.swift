//
//  MainTabController.swift
//  Twitter Clone
//
//  Created by Pusiewicz, M. (Mateusz) on 02/12/2022.
//

import UIKit

class MainTabController: UITabBarController {

    
    //MARK: - Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.layer.cornerRadius = 28
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(MainTabController.self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers()
        configureUI()
    }
     
    
    //MARK: - Selectors
    
    @objc func actionButtonTapped() {
        print(123)
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 56).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64).isActive = true
        actionButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    }
    
    func configureViewControllers() {
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExploreController()
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsController()
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)

        viewControllers = [nav1, nav2, nav3, nav4 ]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav  = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        
        return nav
    }
 
}
