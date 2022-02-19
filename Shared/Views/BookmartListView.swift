//
//  BookmartListView.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 19/02/22.
//

import SwiftUI

struct BookmartListView: View {
    let bookmarks: [BookmarkModel]
    var body: some View {
        List(bookmarks) { bookmark in
            HStack {
                Text(bookmark.surat.nama_latin)
                Text("ayat: \(bookmark.ayat.nomor)")
            }
        }
        .navigationTitle("Bookmark")
    }
}

struct BookmartListView_Previews: PreviewProvider {
    static var previews: some View {
        BookmartListView(bookmarks: BookmarkModel.dummy())
    }
}
