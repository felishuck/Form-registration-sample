//
//  RuleText.swift
//  SwitftUIFormRegistrationUI
//
//  Created by Félix Tineo Ortega on 10/5/22.
//

import Foundation
import SwiftUI


struct RuleText: View {
    var title: String
    var isFulfilled: Bool{
        didSet{
            print("Is Fulfilled? : \(self.isFulfilled)")
        }
    }
    
    var body: some View {
            HStack(spacing: 10){
                Image(systemName: self.isFulfilled ? "checkmark.circle" : "nosign")
                    .foregroundColor(self.isFulfilled ? .green : .red)
                Text(title)
                    .foregroundColor(.gray)
                Spacer()
            }
    }
}

struct RuleTextPreview: PreviewProvider{
    static var previews: some View{
        RuleText(title: "hola que ase", isFulfilled: true)
    }
}
