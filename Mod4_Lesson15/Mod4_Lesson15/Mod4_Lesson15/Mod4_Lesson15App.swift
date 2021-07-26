//
//  Mod4_Lesson15App.swift
//  Mod4_Lesson15
//
//  Created by Brian Kissler on 7/22/21.
//

import SwiftUI

@main
struct Mod4_Lesson15App: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
