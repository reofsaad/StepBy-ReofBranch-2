//
//  StepByView.swift
//  stepBy
//
//  Created by Lina on 06/11/1443 AH.
//

import SwiftUI

struct StepByView: View {
    var body: some View {
        NavigationView {
       
            NavigationLink(destination: DetailsView()){
                
        Image("macpic")
           .resizable()
           .frame(width: 145 , height: 189)
                .cornerRadius(10)
                
            
            }.ignoresSafeArea(.all)
                .navigationBarHidden(true)
                
        
        }
        
    }
}

struct StepByView_Previews: PreviewProvider {
    static var previews: some View {
        StepByView()
    }
}
