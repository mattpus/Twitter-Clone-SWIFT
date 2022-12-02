//
//  RegistrationController.swift
//  Twitter Clone
//
//  Created by Pusiewicz, M. (Mateusz) on 02/12/2022.
//

import UIKit


class RegistrationController: UIViewController {
    //MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleAddPhoto), for: .touchUpInside)
        return button
    }()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = Utilites().attributedButton("Already have an account?", "Sign In")
        button.addTarget(self, action: #selector(handleShowSignIn), for: .touchUpInside)
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "TwitterLogo" )
        return iv
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = UIImage(imageLiteralResourceName: "ic_mail_outline_white_2x-1")
        let view = Utilites().inputContainerView(withImage: image, textField: emailTextField)
    
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = UIImage(imageLiteralResourceName: "ic_lock_outline_white_2x")
        let view = Utilites().inputContainerView(withImage: image, textField: passwordTextField)
        return view
    }()
    
    private lazy var fullNameContainerView: UIView = {
        let image = UIImage(imageLiteralResourceName: "ic_mail_outline_white_2x-1")
        let view = Utilites().inputContainerView(withImage: image, textField: fullNameTextField)
    
        return view
    }()
    
    private lazy var usernameContainerView: UIView = {
        let image = UIImage(imageLiteralResourceName: "ic_lock_outline_white_2x")
        let view = Utilites().inputContainerView(withImage: image, textField: usernameTextField)
        return view
    }()
    
    private let emailTextField: UITextField = {
        let tf = Utilites().textField(withPlaceholder: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilites().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let fullNameTextField: UITextField = {
        let tf = Utilites().textField(withPlaceholder: "Full Name")
        return tf
    }()
    
    private let usernameTextField: UITextField = {
        let tf = Utilites().textField(withPlaceholder: "Username")
        return tf
    }()
    
    private lazy var SignUp: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        return button
    }()
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK:  - Selectors
    
    @objc func handleShowSignIn() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func handleAddPhoto() {
       present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleSignUp() {
        print("Adding account...")
    }
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        view.addSubview(plusButton)
        plusButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        plusButton.setDimensions(width: 128, height: 128)
        
        
        let stack = UIStackView(arrangedSubviews:   [emailContainerView, passwordContainerView, fullNameContainerView, usernameContainerView, SignUp])
        stack.spacing = 16
        stack.axis = .vertical
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: plusButton.bottomAnchor, left: view.leftAnchor,  right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32  )
        
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)

    }
}
//MARK: -UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else {return}
        plusButton.layer.cornerRadius = 64
        plusButton.layer.masksToBounds = true
        plusButton.imageView?.contentMode = .scaleAspectFill
        plusButton.imageView?.clipsToBounds = true
        
        plusButton.layer.borderWidth = 2
        plusButton.layer.borderColor = UIColor.white.cgColor
        self.plusButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil)
    }
}
