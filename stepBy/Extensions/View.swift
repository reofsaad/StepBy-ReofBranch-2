//
//  View.swift
//  stepBy
//
//  Created by Lina on 06/11/1443 AH.
//

import SwiftUI

extension View {
    func hideNavigationBar() -> some View {
        modifier(HideNavigationBarModifier())
    }
}
