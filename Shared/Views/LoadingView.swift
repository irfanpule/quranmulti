//
//  LoadingView.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 26/04/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
