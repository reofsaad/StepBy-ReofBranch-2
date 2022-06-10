//
//  MenuViewModel.swift
//  stepBy
//
//  Created by REOF ALMESHARI on 10/06/2022.
//

import SwiftUI
import FirebaseFirestore

class MenuViewModel: ObservableObject {
    @Published var menuVar : [MenuItems] = []

    init(){
        let db = Firestore.firestore()
        
  
        db.collection("menu").getDocuments{(snap,err) in
            guard let menuData = snap  else {return}
            self.menuVar = menuData.documents.compactMap({(doc) -> MenuItems? in
                let id = doc.documentID
                let name = doc.get("mealName") as! String
                let price = doc.get("price") as! Int
                let picture = doc.get("mealImg") as! String
                let isBestSeller = doc.get("isBestSeller") as! Bool
                
                return MenuItems(id: id, name: name, price: price, picture: picture , isBestSeller: isBestSeller)
      
            })
            

        }

        }
        
    }
