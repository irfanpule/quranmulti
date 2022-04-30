//
//  BookmartListView.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 19/02/22.
//

import SwiftUI

struct BookmartListView: View {
    let coreDM = CoreDataManager()
    @State private var bookmarks: [BookMark] = [BookMark]()
    
    var body: some View {
        List {
            ForEach(bookmarks, id:\.self) { bookmark in
                HStack {
                    Text(bookmark.nama_surat_idn ?? "")
                    Text("ayat: \(bookmark.nomor_ayat)")
                }
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let bookmark = bookmarks[index]
                    coreDM.bookmarkDelete(bookmark: bookmark)
                    reloadList()
                }
            })
        }
        .navigationTitle("Markah")
        .onAppear {
            reloadList()
        }
    }
    
    private func reloadList() {
        bookmarks = coreDM.getAllBookmark()
    }
}

struct BookmartListView_Previews: PreviewProvider {
    static var previews: some View {
        BookmartListView()
    }
}
