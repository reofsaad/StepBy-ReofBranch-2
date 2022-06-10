//
//  UploadImages.swift
//  stepBy
//
//  Created by REOF ALMESHARI on 10/06/2022.
//

import SwiftUI

struct Photos: View {
    var images : [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","1","2","3","4","5","6","7","8","9","10","11","12","2","3","4","5","6","7","8","9","10","11","12"]
    var columnGrid : [GridItem] = [GridItem(.flexible(),spacing:1),GridItem(.flexible(),spacing: 1),GridItem(.flexible(),spacing: 1)]
  
    
    var body: some View {
        
        /*
         1.get image from the user
         connect with firebase storge
         So
         --  add button
         -- organize code */
        ScrollView{
            //will be deleated just to see page size and how its look
            Rectangle()
                .fill()
                .frame(height:200)
            ////////////////////// //// 
        LazyVGrid(columns:columnGrid , spacing: 1){
            
            ForEach(images,id: \.self){ images in
                Image(images)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (UIScreen.main.bounds.width / 3) - 1  , height: (UIScreen.main.bounds.width / 3) - 1, alignment: .center)
                    .clipped()
                    .cornerRadius(4)
            }
        

        }

        
      
       
        }
        //button
        Button(action: {}, label: {
            Text("Upload Photos").font(.headline).foregroundColor(Color.white).padding().background(Color.green
                .cornerRadius(10).frame(width: 300, height: 50))
        })
    }
    
}

struct UploadImages_Previews: PreviewProvider {
    static var previews: some View {
        Photos()
    }
}
