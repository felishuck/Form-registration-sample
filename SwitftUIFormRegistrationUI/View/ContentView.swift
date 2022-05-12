//
//  ContentView.swift
//  SwitftUIFormRegistrationUI
//
//  Created by Félix Tineo Ortega on 10/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var formChecker = FormChecker()
    
    var body: some View {
        VStack(spacing: 50){
            Text("Create an account")
                .font(.system(.largeTitle))
                .fontWeight(.bold)
            VStack(spacing: 20){
                VStack{
                    TextField("Username", text: self.$formChecker.userName)
                    Divider()
                }
                RuleText(title: "A minimum of 4 characters", isFulfilled: self.formChecker.moreThan4Characters)
                VStack{
                    SecureField("Password", text: self.$formChecker.password)
                    Divider()
                }
                RuleText(title: "A minimum of 8 characters", isFulfilled: self.formChecker.moreThan8Characters)
                RuleText(title: "One uppercase letter", isFulfilled: self.formChecker.oneUppercaseCharacter)
                VStack{
                    SecureField("Confirm password", text: self.$formChecker.passwordConfirmation)
                    Divider()
                }
                RuleText(title: "You confirm password should be the same as passwordl", isFulfilled: self.formChecker.passwordMatch)
            }
            Button {
                print("Opening Sign up View")
            } label: {
                Text("Sign up")
                    .foregroundColor(.white)
                    .font(.system(.body))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(self.formChecker.signInAvailable ?
                                LinearGradient(colors: [.pink, .orange], startPoint: .bottomLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [.black, .gray], startPoint: .bottomLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(10)
            }.disabled(!self.formChecker.signInAvailable)
            HStack{
                Text("Already have an account?")
                    .fontWeight(.bold)
                Button {
                    print("Opening Sign in View")
                } label: {
                    Text("Sign in")
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                }
            }
            Spacer()
        }.padding(30)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FormChecker())
    }
}
