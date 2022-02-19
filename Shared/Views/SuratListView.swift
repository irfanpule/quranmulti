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
            NavigationLink(
                destination: SuratDetailView(detailSurat: SuratDetailModel.dummy()),
                label: {
                    HStack(spacing: 15) {
                        Text("\(surat.nomor)")
                        VStack(alignment: .leading) {
                            Text(surat.nama_latin)
                            HStack {
                                Text(surat.arti)
                                Text("(\(surat.jumlah_ayat))")
                            }
                        }
                        Text(surat.nama).multilineTextAlignment(.trailing)
                        Spacer()
                    }
                    .padding(6)
                })
        }
        .navigationTitle("Quran")
    }
}

struct SuratListView_Previews: PreviewProvider {
    static var previews: some View {
        SuratListView(surats: SuratModel.dummy())
            .preferredColorScheme(.dark)
    }
}
