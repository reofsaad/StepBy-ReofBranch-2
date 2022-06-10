//
//  HideNavigationBarModifier.swift
//  stepBy
//
//  Created by Lina on 06/11/1443 AH.
//

import SwiftUI

struct HideNavigationBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationBarTitle("")
    }
}


