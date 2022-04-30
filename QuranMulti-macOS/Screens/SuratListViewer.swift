//
//  SuratListViewer.swift
//  QuranMulti-macOS
//
//  Created by Muhammad Irfan on 19/02/22.
//

import SwiftUI

struct SuratListViewer: View {
    @State var selection: NavigationItem? = .quran

    func toggleSideBar() {
      NSApp.keyWindow?.firstResponder?.tryToPerform(
        #selector(NSSplitViewController.toggleSidebar),
        with: nil)
    }

    var sideBar: some View {
      List(selection: $selection) {
        NavigationLink(
            destination: SuratListView(surats: SuratModel.dummy()),
          tag: NavigationItem.quran,
          selection: $selection
        ) {
          Label("Quran", systemImage: "book.fill")
        }
        .tag(NavigationItem.quran)
        NavigationLink(
            destination: BookmartListView(),
          tag: NavigationItem.bookmarks,
          selection: $selection
        ) {
          Label("Markah", systemImage: "bookmark.fill")
        }
        .tag(NavigationItem.bookmarks)
      }
      // 3
      .frame(minWidth: 200)
      .listStyle(SidebarListStyle())
      .toolbar {
        // 4
        ToolbarItem {
          Button(action: toggleSideBar) {
            Label("Toggle Sidebar", systemImage: "sidebar.left")
          }
        }
      }
    }

    
    var body: some View {
        NavigationView {
          sideBar
          Text("Pilih Surat")
            .foregroundColor(.secondary)
          Text("Pilih Surat")
            .foregroundColor(.secondary)
        }
    }
}

struct SuratListViewer_Previews: PreviewProvider {
    static var previews: some View {
        SuratListViewer()
    }
}
