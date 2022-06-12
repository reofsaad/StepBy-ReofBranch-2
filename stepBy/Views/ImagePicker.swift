//
//  SwiftUIView.swift
//  stepBy
//
//  Created by REOF ALMESHARI on 11/06/2022.
//

import UIKit
import SwiftUI

struct ImagePicker  : UIViewControllerRepresentable{
    

    @Binding var isPickingShowing : Bool
    @Binding var selectedImage : UIImage?
    
   
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate=context.coordinator
        
        imagePicker.allowsEditing = true
        return imagePicker
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator{Coordinator(self)}
}


class Coordinator:NSObject,UINavigationControllerDelegate
,UIImagePickerControllerDelegate{
  
    var parent : ImagePicker
    init(_ picker:ImagePicker){
        self.parent=picker
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        
        if let image  = info[UIImagePickerController.InfoKey.originalImage] as?  UIImage{
            DispatchQueue.main.async {
                // to be able to get image from user
                self.parent.selectedImage = image
            }
        }
        // Dismiss picker
        parent.isPickingShowing = false
      
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.isPickingShowing = false
    }
}
