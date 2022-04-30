//
//  BookmarkCardView.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 30/04/22.
//

import SwiftUI

struct BookmarkCardView: View {
    let bookmark: BookMark
    var body: some View {
        VStack(alignment: .leading) {
            Text(bookmark.nama_surat_idn!)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(bookmark.nomor_ayat)", systemImage: "book")
                Spacer()
                Text(bookmark.nama_surat_ar!)
            }
            .font(.caption)
            #if os(macOS)
                Divider()
            #endif
        }
        .padding()
    }
}

//struct BookmarkCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookmarkCardView()
//    }
//}
