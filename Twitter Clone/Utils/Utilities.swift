//
//  Utilities.swift
//  Twitter Clone
//
//  Created by Pusiewicz, M. (Mateusz) on 02/12/2022.
//

import UIKit


class Utilites {
    
    
    func inputContainerView(withImage image: UIImage, textField: UITextField) -> UIView {
        
        
        let view = UIView()
        let iv = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        iv.image = image
        view.addSubview(iv)
        iv.setDimensions(width: 24, height: 24)
        iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor,
                   paddingBottom: 8)
   
        
        view.addSubview(textField)
        textField.anchor(left: iv.rightAnchor, bottom: view.bottomAnchor,
                         right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8 )
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        dividerView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor,
                           right: view.rightAnchor, height: 0.75)
        return view
    }
    
    func textField(withPlaceholder placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:
                            [NSAttributedString.Key.foregroundColor: UIColor.white])
        tf.textColor = .white
        return tf
    }
    
    
    func attributedButton(_ message: String, _ action: String) -> UIButton {
        let button = UIButton(type: .system)
        let  attributedMessage = NSMutableAttributedString(string: message, attributes:
                            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                             NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attributedMessage.append(NSMutableAttributedString(string: " \(action)", attributes:
                          [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
                           NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedMessage, for: .normal)
        return button
    }
    
}
