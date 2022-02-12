//
//  ContentView.swift
//  QuranMulti-macOS
//
//  Created by Muhammad Irfan on 12/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SuratListView(surats: SuratModel.dummy())
                .frame(minWidth: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
