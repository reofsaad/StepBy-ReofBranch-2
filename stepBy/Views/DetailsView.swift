//
//  DetailsView.swift
//  stepBy
//
//  Created by Lina on 06/11/1443 AH.
//

import SwiftUI

struct DetailsView: View {
    
    @State var offset: CGFloat = 0
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var currentTab = "Overview"
    
    @State var tabBarOffset: CGFloat = 0
    
    @State var titleOffest: CGFloat = 0
    
    
    @Namespace var animation
    
    var backBtn : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
           }) {
               HStack {
               Image(systemName: "chevron.backward") // set image here
                   .aspectRatio(contentMode: .fit)
                   .foregroundColor(.white)
                   Text("Back").foregroundColor(.white)
               }
           }
       }
    
  

    var likeBtn : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
           }) {
               HStack {
               Image(systemName: "heart") // set image here
                   .aspectRatio(contentMode: .fit)
                   .foregroundColor(.white)
               }
           }
       }
    
    var body: some View {
        
        ScrollView(.vertical , showsIndicators: false, content: {
            
            VStack(spacing:15){
                
              
               
  
                GeometryReader{proxy -> AnyView in
                    
                    let minY = proxy.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    return AnyView(
                     
                            
                        
                        ZStack{
                            
                            customNavigationBar
                                .padding(.horizontal, 24).padding(.top , -120)
                                .zIndex(1)
                            
                                    
                                
                               
                            
                            Image("macpic").resizable().aspectRatio(contentMode: .fill ).frame(width: getRec().width, height: minY > 0 ? 330 + minY : 330, alignment: .center).cornerRadius(0)
                            
                            BlurView().opacity(blurViewOpecity())
                            
                            VStack(spacing:5){
                                Text("McDonald’s")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            
                            }.offset(y:90)
                                .offset(y:titleOffest > 20 ? 0 : -getTitleOffest() )
                                .opacity(titleOffest < 180 ? 1 : 0)
                           
                            
                        }.frame( height: minY > 0 ? 330 + minY : nil)
                            .offset(y: minY > 0 ? -minY : -minY < 200 ? 0 : -minY - 200)
                            
                        
                    )
                        
                    
                }
                .frame(height: 330)
                .zIndex(1)
              
              
                   
                
               
                
                //info above the header
            
               
                 
            
                    
                    VStack(){
                    HStack()
                    {
                        
                    //has loyality
                    Image(systemName:"heart.rectangle.fill").resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 28, height: 28)
                        .foregroundColor(.green)
                        
                        
                    //store name
                        Text ("McDonald’s")
                        .fontWeight(.regular)
                        .foregroundColor(.blue)
                    }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 32.0)
                      

                    HStack{
                    //location
                    Text ("Al Thoumamah Rd, Al Munsiyah")
                        .fontWeight(.regular)
                        .foregroundColor(.blue)
                        //price range
                    Text ("• $$$$")
                        .fontWeight(.regular)
                        .foregroundColor(.blue)
                  
                    
                    }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 32.0)
                    }.padding(.top, -130)
                    .zIndex(-offset > 140 ? 0: 1)
                    .overlay(
                        GeometryReader{reader -> Color in
                            let minY = reader.frame(in: .global).minY
                            
                            DispatchQueue.main.async {
                               
                                self.titleOffest = minY                                }
                            print(minY)
                            return Color.clear
                            
                        }.frame(width: 0, height: 0)
                        ,alignment: .top
                    )
                
                
                    
                     
          
                VStack(spacing:0){
                    
                        HStack(spacing:0){
                            
                            menuBarItem(title: "Overview", currentTab: $currentTab, animation: animation)
                            
                            menuBarItem(title: "Menu", currentTab: $currentTab, animation: animation)
                            
                            menuBarItem(title: "Reviews", currentTab: $currentTab, animation: animation)
                            
                            menuBarItem(title: "Photos", currentTab: $currentTab, animation: animation)
                            
                            
                            
                        }.frame(width: UIScreen.main.bounds.size.width)
                            
                            
            
                            
                        }.background(
                    RoundedCornersShape(corners: [.topLeft, .topRight], radius: 30)
                        .fill(.white)
                        ).padding(.top,-65)
                        .background(Color.white)
                        .offset(y: tabBarOffset < 140 ? -tabBarOffset + 140 : 0)
                        .overlay(
                            GeometryReader{reader -> Color in
                                let minY = reader.frame(in: .global).minY
                                
                                DispatchQueue.main.async {
                                    self.tabBarOffset = minY
                                
                                
                                }
                            
                                return Color.clear
                                
                            }.frame(width: 0, height: 0)
                        ).zIndex(1)
                    
                    
                                            VStack(){
                                                ScrollView(.vertical , showsIndicators: false, content: {
                                                HStack(){
                                                HStack(){
                                                    Circle().fill(.green).frame(width: 8, height: 8)
                                                    Text("Open Now")
                                                }.padding(8)
                                                    .foregroundColor(.white)
                                                    .background(Color.gray)
                                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                                                    Spacer()
                    
                                                    VStack(){
                    
                                                        Text("3.0 Km").padding(8)
                                                        .foregroundColor(.white)
                                                        .background(Color.gray)
                                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                                        HStack{
                                                        Image(systemName: "phone.fill")
                    
                    
                                                        Text("Call")
                    
                                                        }.padding(8)
                                                            .foregroundColor(.white)
                                                            .background(Color.green)
                                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    
                                                    }
                                                }.padding(.horizontal,24)
                    
                                                HStack{
                                                    Image(systemName: "clock.fill").foregroundColor(.orange)
                    
                    
                                                    Text("Hours").fontWeight(.heavy)
                    
                    
                                                }.frame(maxWidth: .infinity ,alignment: .leading).padding(.horizontal,24)
                                             
                    
                                                })
                    
                    
                                            }.zIndex(0)
                    
                  
                    
               
                    
            }
        
        }
                
        ).hideNavigationBar()
            .ignoresSafeArea(.all, edges: .top)
       
      
        
        
    }
    
    func getTitleOffest()->CGFloat{
        let progress = 20 / titleOffest
        
        let offest = progress > 0 && progress <= 1 ? progress : 1
        
        return offest
    }
    
    
    func blurViewOpecity()->Double{
        let progress = -(offset + 80)/150
        return Double(-offset > 80 ? progress : 0)
    }


struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
        
}


extension DetailsView {
    private var customNavigationBar: some View {
        HStack {
            backBtn
            Spacer()
            likeBtn
        }
    }
}

extension View{
    func getRec()->CGRect{
        return UIScreen.main.bounds
    }
    
}


struct menuBarItem: View {
    
    var title:String
    @Binding var currentTab: String
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation{
                currentTab = title
            }
            
        }, label: {
            
            LazyVStack(spacing: 12){
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? .orange : .gray)
                    .padding(.horizontal)
                    .padding(.top,28)
                
                if currentTab == title{
                    
                    Capsule()
                        .fill(.orange)
                        .frame( height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
                else{
                    Capsule()
                        .fill(.gray)
                        .frame( height: 1.2)
                    
                }
            }
        })
        
        
    }
    
}
