//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/27/20.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image?
    
    func load(fromURLString urlString: String){
        NetworkManager.shared.downloadImage(fromURlString: urlString) { (uiImage) in
            guard let uiImage = uiImage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlStirng: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlStirng)
            }
    }
}
