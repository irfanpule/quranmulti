//
//  ContentView.swift
//  QuranMulti-iOS
//
//  Created by Muhammad Irfan on 12/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                SuratListView()
            }
                .tabItem {Label("Qur'an", systemImage: "book.fill")}
                .tag(NavigationItem.quran)
            
            NavigationView {
                BookmartListView()
            }
                .tabItem {
                    Label("Markah", systemImage: "bookmark.fill")
                }
                .tag(NavigationItem.bookmarks)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
