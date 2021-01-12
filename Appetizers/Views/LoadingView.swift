//
//  File.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/27/20.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let activityView = UIActivityIndicatorView(style: .large)
        activityView.color = UIColor.brandPrimary
        activityView.startAnimating()
        return activityView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
//            ActivityIndicator()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}

