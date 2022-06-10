//
//  stepByApp.swift
//  stepBy
//
//  Created by Lina on 06/11/1443 AH.
//

import SwiftUI
import Firebase

@main
struct stepByApp: App {
    init(){
        FirebaseApp.configure()
        
    }
    var body: some Scene {
        WindowGroup {
           ContentView()
      
        }
    }
}
