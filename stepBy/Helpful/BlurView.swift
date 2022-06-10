//
//  BlurView.swift
//  stepBy
//
//  Created by Lina on 07/11/1443 AH.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
   
    func makeUIView(context: Context) -> some UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        
    }
   
}
