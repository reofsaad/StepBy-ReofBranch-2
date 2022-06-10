//
//  Menu.swift
//  stepBy
//
//  Created by REOF ALMESHARI on 09/06/2022.
//

import SwiftUI
import FirebaseFirestore
import Kingfisher

struct MenuView: View {
    /*
     1. work on bestseller to be change each week or month
     2. page design
    
     4. add each item in the desire category
     5.overlay on images
     6. button to view pdf menu - check */
    
    @StateObject var menuModel = MenuViewModel()
    
   
    var columnGrid : [GridItem] = [GridItem(.flexible(),spacing:1),GridItem(.flexible(),spacing: 1)]
    
    var body: some View {
       
        ScrollView{
            
        VStack{
            ZStack{
                HStack{
                    Spacer()
                    Spacer()
                    Image("image 10")
                    //Best Seller 
//                    ForEach(categories.menuVar){ i in
//
//
//                        if i.isBestSeller {
//                    KFImage(URL(string:i.picture))
//                    .resizable()
//                            .scaledToFit()
//                            .frame(width: 200, height: 200, alignment: .center)
//                        }}
                    Spacer()
                    Spacer()
                }
                VStack{
                 
                    Spacer()
                    Spacer()
                    Text("Our Best Seller!")
                        .foregroundColor(.white)
                        .frame(width: 320, height: 70, alignment: .topLeading)
                    Spacer()
                    Spacer()
                    HStack{
                        Spacer()
                       
                    Text("French Fries!")
                        .foregroundColor(.white)
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("6 SAR") .foregroundColor(.white)
                        Spacer()
                       
                    }
                    Spacer()
                    Spacer()
                  
                 
                }
                
                   
            }
          
            LazyVGrid(columns: columnGrid){
                Section(header: Text("Breakfast").font(.title).bold().padding(.trailing, 230)){
                ForEach(menuModel.menuVar){i in
                    ZStack{
                    KFImage(URL(string:i.picture))
                        VStack{
                            Spacer()
                ZStack{
                        
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 70, height: 25)
                        .foregroundColor(.orange)
                        .padding(.leading,90)
                    Text("\(i.price) SAR")
                        .foregroundColor(.white)
                        .padding(.leading,90)
                }
                            Spacer()
                            Spacer()
                            Spacer()
                           
                            Text(i.name)
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.trailing,85)
                                .padding(.bottom,5)
                              
                           
                        
                        }
                        
                    }
                        
                    }
                    
                }
                Spacer()
                
                
//                Section(header: Text("Sandwiches").font(.title).bold().padding(.trailing, 210)){}
//
//                Spacer()
//                Section(header: Text("Dessert").font(.title).bold().padding(.trailing, 230)){}
//                Spacer()
//                Section(header: Text("Beverages").font(.title).bold().padding(.trailing, 230)){}
            }
            
            Link(destination: URL(string: "https://www.mcdonalds.com/sa/en-sa/riyadh/full-menu.html")!, label: {
                Text("View Menu ")
                    .bold()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(12)
            })
                
        }
          

        
        }
        
        
    }
 

  
    }










struct MenuItems : Identifiable{
    var id :String
    var name :String
    var price : Int
    var picture : String
    var isBestSeller : Bool
}




