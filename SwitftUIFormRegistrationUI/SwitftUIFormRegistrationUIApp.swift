//
//  SwitftUIFormRegistrationUIApp.swift
//  SwitftUIFormRegistrationUI
//
//  Created by Félix Tineo Ortega on 10/5/22.
//

import SwiftUI

@main
struct SwitftUIFormRegistrationUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(FormChecker())
        }
    }
}
