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
                    
//                    Best Seller
                    ForEach(menuModel.menuVar){ i in


                        if i.isBestSeller {
                    KFImage(URL(string:i.picture))
                    
                    .resizable()
                            .scaledToFit()
                            .frame(width: 360, height: 160, alignment: .center)
                            .overlay(
                              Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [.black,.clear,.clear, .black]), startPoint: .top, endPoint: .bottom)
                                )
                                .opacity(0.4)
                            )
                            .cornerRadius(20)
                            .frame(width: 10, height: 190)
                        }
                        
                        
                    }
                    Spacer()
                    Spacer()
                }
                VStack{
                 
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Our Best Seller!")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 330, height: 70, alignment: .topLeading)
                    Spacer()
                    Spacer()
                    
                    HStack{
                        Spacer()
                       
                    Text("French Fries!")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 190, height: 70, alignment: .leading)
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("6 SAR") .foregroundColor(.white)
                        .fontWeight(.bold)
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
                        HStack{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                    KFImage(URL(string:i.picture))
                                .resizable()
                                .overlay(
                                  Rectangle()
                                    .fill(
                                      LinearGradient(gradient: Gradient(colors: [.clear,.clear, .black]), startPoint: .top, endPoint: .bottom)
                                    )
                                    .opacity(0.4)
                                )
                                .cornerRadius(20)
                                .frame(width: 170, height: 190)
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                        }
                      
                        VStack{
                            Spacer()
                ZStack{
                        
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 70, height: 25)
                        .foregroundColor(.orange)
                        .padding(.leading,100)
                    Text("\(i.price) SAR")
                        .foregroundColor(.white)
                        .padding(.leading,100)
                }
                            Spacer()
                            Spacer()
                            Spacer()
                           
                            VStack{
                             
                            Text(i.name)
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 140, height: 30, alignment: .topLeading)
                               
                            
                            }
                              
                              
                           
                        
                        }
                        
                    }
                        
                    }
                    
                }
                Spacer()
                
                
                Section(header: Text("Sandwiches").font(.title).bold().padding(.trailing, 210)){}

                Spacer()
                Section(header: Text("Dessert").font(.title).bold().padding(.trailing, 230)){}
                Spacer()
                Section(header: Text("Beverages").font(.title).bold().padding(.trailing, 230)){}
            }
            
            
                
        }
           
          
           
        
        }
        Link(destination: URL(string: "https://www.mcdonalds.com/sa/en-sa/riyadh/full-menu.html")!, label: {
            Text("View Menu ")
                .bold()
                .frame(width: 360, height: 53)
                .foregroundColor(.white)
                .background(Color("Green"))
                .cornerRadius(12)
        })
        
        
        
//        .background(Color("Gray"))
//        .ignoresSafeArea()
    }
 
       
  
}









struct MenuItems : Identifiable{
    var id :String
    var name :String
    var price : Int
    var picture : String
    var isBestSeller : Bool
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
//            .preferredColorScheme(.dark)
    }
}




