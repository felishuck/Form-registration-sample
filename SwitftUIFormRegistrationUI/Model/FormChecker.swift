//
//  FormChecker.swift
//  SwitftUIFormRegistrationUI
//
//  Created by Félix Tineo Ortega on 11/5/22.
//

import Foundation
import Combine

class FormChecker: ObservableObject{
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var passwordConfirmation: String = ""
    
    @Published var moreThan4Characters: Bool = false
    @Published var moreThan8Characters: Bool = false
    @Published var oneUppercaseCharacter: Bool = false
    @Published var passwordMatch:Bool = false
    
    @Published var signInAvailable: Bool = false
    
    private var cancelableSet: Set<AnyCancellable> = []
    
    init(){
        $userName
            .receive(on: RunLoop.main)
            .map{ userName in
                self.updateSignInAvailable()
                return userName.count >= 4
            }
            .assign(to: \.moreThan4Characters, on: self)
            .store(in: &cancelableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                self.updateSignInAvailable()
                return password.count >= 8
            }
            .assign(to: \.moreThan8Characters, on: self)
            .store(in: &cancelableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                self.updateSignInAvailable()
                let pattern = "[A-Z]"
                if let _ = password.range(of: pattern, options: .regularExpression){
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.oneUppercaseCharacter, on: self)
            .store(in: &cancelableSet)
        
        Publishers.CombineLatest($password, $passwordConfirmation)
            .receive(on: RunLoop.main)
            .map { password, passwordConfirmation in
                self.updateSignInAvailable()
                return !passwordConfirmation.isEmpty && (password == passwordConfirmation)
            }
            .assign(to: \.passwordMatch, on: self)
            .store(in: &cancelableSet)
        
    }
    
    func updateSignInAvailable(){
        self.signInAvailable = moreThan4Characters && moreThan8Characters && oneUppercaseCharacter && passwordMatch
    }
    
}
