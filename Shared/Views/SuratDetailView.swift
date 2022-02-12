//
//  SuratDetailView.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 12/02/22.
//

import SwiftUI

struct SuratDetailView: View {
    let detailSurat: SuratDetailModel
    
    var body: some View {
        VStack {
            
            Text(detailSurat.surat.nama_latin)
            Text(detailSurat.surat.nama)
            
            List(detailSurat.ayat) { ayat in
                HStack {
                    Text("\(ayat.nomor)")
                    VStack {
                        Text(ayat.ar)
                        Text(ayat.idn)
                    }
                }
            }
        }
        .navigationTitle(detailSurat.surat.nama_latin)
    }
}

struct SuratDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SuratDetailView(detailSurat: SuratDetailModel.dummy())
    }
}
