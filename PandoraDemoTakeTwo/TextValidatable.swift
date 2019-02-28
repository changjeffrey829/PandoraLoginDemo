//
//  TextValidator.swift
//  PandoraDemoTakeTwo
//
//  Created by Jeffrey Chang on 2/22/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

protocol TextValidatable {
    func emailTextValidation(email: String) -> Bool
    func passwordTextValidation(password: String) -> Bool
}

extension TextValidatable {
    func emailTextValidation(email: String) -> Bool {
        return email.count > 3 && email.contains("@")
    }
    
    func passwordTextValidation(password: String) -> Bool {
        return password.count > 5
    }
}
