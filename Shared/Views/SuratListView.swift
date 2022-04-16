//
//  SuratListView.swift
//  QuranMulti-iOS
//
//  Created by Muhammad Irfan on 12/02/22.
//

import SwiftUI

struct SuratListView: View {
    @State var surats: [SuratModel] = []
    
    var body: some View {
        List(surats, id: \.nomor) { surat in
            NavigationLink(
                destination: SuratDetailView(surat: surat),
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
        .frame(minWidth: 280)
        .onAppear {
            APIService().getSurat { surats in
                self.surats = surats
            }
        }
    }
}

struct SuratListView_Previews: PreviewProvider {
    static var previews: some View {
        SuratListView(surats: SuratModel.dummy())
            .preferredColorScheme(.dark)
    }
}
