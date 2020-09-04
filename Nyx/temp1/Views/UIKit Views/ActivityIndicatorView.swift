//
//  ActivityIndicatorView.swift
//  temp1
//
//  Created by Zach Soles on 8/3/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context){}
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}
