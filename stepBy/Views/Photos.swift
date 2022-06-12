//
//  UploadImages.swift
//  stepBy
//
//  Created by REOF ALMESHARI on 10/06/2022.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import Kingfisher
struct Photos: View {
    @State var isPickingShowing = false
    @State var selectedImage : UIImage?
    @State var retrivedImages = [UIImage]()
    @StateObject var photpModel = PhotoViewModel()
    var columnGrid : [GridItem] = [GridItem(.flexible(),spacing:1),GridItem(.flexible(),spacing: 1),GridItem(.flexible(),spacing: 1)]
    var body: some View {
        
        VStack{
            
        
    
            LazyVGrid(columns:columnGrid , spacing: 1){
                //for loop through db
                ForEach(photpModel.photoVar){ image in
                    KFImage(URL(string:image.picture))
                        .resizable()
                        .scaledToFill()
                        .frame(width: (UIScreen.main.bounds.width / 3) - 1  , height: (UIScreen.main.bounds.width / 3) - 1, alignment: .center)
                        .clipped()
                        .cornerRadius(4)
                }


            }
            Divider()
            Button{
                self.isPickingShowing.toggle()
                if selectedImage != nil {
                    uploadPhoto()
                    
                }
            }label: {
                Text("Select Image")
            }
           
            
            
//            HStack{
//                ForEach(retrivedImages,id: \.self){ img in
//                    Image(uiImage: img)
//                        .resizable()
//                        .frame(width: 200, height: 200)
//                }
//            }
            
        }.sheet(isPresented: $isPickingShowing, onDismiss: nil){
            ImagePicker(isPickingShowing: $isPickingShowing, selectedImage: $selectedImage)
        }
//        .onAppear{
//            RetrivePhoto()
//        }
   
        
    }
    
    func uploadPhoto(){
        guard  selectedImage != nil else {
            return
        }
        
        // create storage ref
        let storageRef = Storage.storage().reference()
        
        //turn image into data
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else { return}
        // Specify path and name
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef  = storageRef.child(path)
        //Upload data
        let uploadTask = fileRef.putData(imageData!,metadata: nil){metadata,error in
            //check for errors
            if  error == nil && metadata != nil  {
                // save ref to the file in  firebase DB
                
                let db = Firestore.firestore()
                
            //   db.collection("Images").document().setData(["url":path])
                db.collection("Images").document().setData(["url":path]){ error in
                    if error == nil {
                        // add  the uploaded photo to the list of images to display
                        DispatchQueue.main.async {
                            self.retrivedImages.append(self.selectedImage!)
                        }

                    }
                }
            }
            
        }
        
        
        
    }
    
//    func RetrivePhoto(){
//        //get Data from DB
//        let db = Firestore.firestore()
//        db.collection("Images").getDocuments {snapshot,error in
//
//            if error == nil && snapshot != nil {
//                var paths = [String]()
//                // loop through all returned documents
//                for doc in snapshot!.documents{
//                    // Extract file path
//
//                        paths.append(doc["url"] as! String)
//
//
//                }
//                // loop through each file path & fetch data from storage
//                for path in paths {
//                    // get  ref to the storage
//                    let storageRef = Storage.storage().reference()
//                    //Specify path
//                    let fileRef = storageRef.child(path)
//                    //Retrive data
//                    fileRef.getData(maxSize: 5 * 1024 * 1024){data , err in
//                        //check errors
//                        if err == nil && data != nil {
//                            // create uiimage and put it into retrivedarray for display
//                            if let image = UIImage(data: data!){
//                                DispatchQueue.main.async {
//                                    retrivedImages.append(image)
//
//                                }
//                            }
//
//                        }
//
//                    }
//                } //end  loop through path
//            }
//        }
//        //get image data in storage for each ref
//
//        //Display Images
//    }
}

class PhotoViewModel: ObservableObject {
    @Published var photoVar : [PhotoD] = []

    init(){
        let db = Firestore.firestore()


        db.collection("Images").getDocuments{(snap,err) in
            guard let menuData = snap  else {return}
            self.photoVar = menuData.documents.compactMap({(doc) -> PhotoD? in
                let id = doc.documentID
                let picture = doc.get("url") as! String
//         print(picture)

                return PhotoD(id: id, picture: picture)

            })


        }

        }

    }


struct PhotoD : Identifiable{
    var id :String
    var picture : String
 
}

//struct Photos: View {
//    @State var  showingImagePicker = false
//    @State var  image : UIImage?
//    @State var  inputImage : UIImage?
//    var im : [UIImage] = []
//    var images : [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","1","2","3","4","5","6","7","8","9","10","11","12","2","3","4","5","6","7","8","9","10","11","12"]
//    var columnGrid : [GridItem] = [GridItem(.flexible(),spacing:1),GridItem(.flexible(),spacing: 1),GridItem(.flexible(),spacing: 1)]
//
//
//    var body: some View {
//
//        /*
//         1.get image from the user
//         connect with firebase storge
//         So
//         --  add button
//         -- organize code */
//        ScrollView{
//            //will be deleated just to see page size and how its look
//            Rectangle()
//                .fill()
//                .frame(height:200)
//            ////////////////////// ////
//        LazyVGrid(columns:columnGrid , spacing: 1){
//
//            ForEach(images,id: \.self){ i in
//                Image(i)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: (UIScreen.main.bounds.width / 3) - 1  , height: (UIScreen.main.bounds.width / 3) - 1, alignment: .center)
//                    .clipped()
//                    .cornerRadius(4)
//           }
//
//
//        }
//
//
//
//
//        }
//        //button
//        Button(action: {
//
//            self.showingImagePicker.toggle()
//
//        }, label: {
//            Text("Upload Photos").font(.headline).foregroundColor(Color.white).padding().background(Color.green
//                .cornerRadius(10).frame(width: 300, height: 50))
//        }).sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
//            ImagePicker(image: self.$inputImage)
//        }
//
//
//    }
//    func loadImage(){
//        guard let inputImage = inputImage else {
//            return
//        }
//        image = inputImage
//
//
//
//    }
//
//}

