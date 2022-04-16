//
//  SuratDetailView.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 12/02/22.
//

import SwiftUI

struct SuratDetailView: View {
    @State var surat: SuratModel
    @State var detailSurat: SuratDetailModel = SuratDetailModel(ayat: [], status: true)
    
    var body: some View {
        VStack {
            
            Text(surat.nama_latin)
            Text(surat.nama)
            
            List(detailSurat.ayat, id: \.nomor) { ayat in
                AyatCardView(ayat: ayat)
            }
            .onAppear {
                APIService().getAyat(nomor_surat: surat.nomor) { suratDetail in
                    self.detailSurat = suratDetail
                }
            }
        }
        .navigationTitle(surat.nama_latin)
    }
}

struct SuratDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SuratDetailView(surat: SuratModel.dummy()[0], detailSurat: SuratDetailModel.dummy())
    }
}
