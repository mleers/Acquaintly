//
//  AddPerson.swift
//  Acquaintly
//
//  Created by Mitch on 12/21/22.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var name = ""
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State private var isShowingImagePicker = false
    @State private var isShowingConfirmAlert = false
        
    var hasImageAndName: Bool {
        inputImage != nil && !name.isEmpty
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Image") {
                    if inputImage != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        ImagePlaceholder(color: .blue)
                            .onTapGesture {
                                isShowingImagePicker = true
                            }
                    }
                }
                .onChange(of: inputImage) { newValue in
                    setImage(uiImage: newValue)
                }
                
                Section("Name") {
                    TextField("Name", text: $name)
                }
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .toolbar {
                Button {
                    guard let inputImage = inputImage else { return }
                    guard let jpegData = inputImage.jpegData(
                        compressionQuality: 0.8
                    ) else { return }
                    
                    let person = Person(
                        name: name,
                        jpegData: jpegData
                    )
                    
                    viewModel.addPerson(person)
                    dismiss()
                } label: {
                    Text("Save")
                }
                .disabled(!hasImageAndName)
            }
            .navigationTitle("Add a new person")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func setImage(uiImage: UIImage?) {
        guard let uiImage = uiImage else { return }
        
        image = Image(uiImage: uiImage)
    }
}


struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}
