//
//  SuratListView.swift
//  QuranMulti-iOS
//
//  Created by Muhammad Irfan on 12/02/22.
//

import SwiftUI

struct SuratListView: View {
    let surats: [SuratModel]
    
    var body: some View {
        List(surats) { surat in
            HStack {
                Text("\(surat.nomor)")
                VStack(alignment: .leading) {
                    Text(surat.nama_latin)
                    Text(surat.arti)
                }
                Text(surat.nama)
            }
        }
        .navigationTitle("Quran")
    }
}

struct SuratListView_Previews: PreviewProvider {
    static var previews: some View {
        SuratListView(surats: SuratModel.dummy())
    }
}
