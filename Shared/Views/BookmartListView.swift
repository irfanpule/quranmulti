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
        List(bookmarks, id:\.self) { bookmark in
            HStack {
                Text(bookmark.nama_surat_idn ?? "")
                Text("ayat: \(bookmark.nomor_ayat)")
            }
        }
        .navigationTitle("Markah")
        .onAppear {
            bookmarks = coreDM.getAllBookmark()
        }
    }
}

struct BookmartListView_Previews: PreviewProvider {
    static var previews: some View {
        BookmartListView()
    }
}
