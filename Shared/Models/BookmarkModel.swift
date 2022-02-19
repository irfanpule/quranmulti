//
//  BookmarkModel.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 19/02/22.
//

import Foundation

struct BookmarkModel: Identifiable {
    var id = UUID()
    var surat: SuratModel
    var ayat: AyatModel
}

extension BookmarkModel {
    static func dummy() -> [BookmarkModel] {
        return [
            BookmarkModel(surat: SuratModel.dummy()[0], ayat: AyatModel.dummy()[0]),
            BookmarkModel(surat: SuratModel.dummy()[1], ayat: AyatModel.dummy()[1])
        ]
    }
}
