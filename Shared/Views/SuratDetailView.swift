//
//  SuratDetailView.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 12/02/22.
//

import SwiftUI

struct SuratDetailView: View {
    @State var mp3Play = false
    @State var surat: SuratModel
    @State var detailSurat: SuratDetailModel = SuratDetailModel(ayat: [], status: true)
    @StateObject private var soundManager = SoundManager()
    
    var body: some View {
        VStack {
            #if os(macOS)
                Text(surat.nama_latin)
            #endif
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
        .toolbar {
            Button(action: {
                soundManager.playSound(sound: surat.audio)
                mp3Play.toggle()
                
                if mp3Play {
                    soundManager.audioPlayer?.play()
                } else {
                    soundManager.audioPlayer?.pause()
                }
            }) {
                Image(systemName: mp3Play ? "pause.circle.fill": "play.circle.fill")
            }
        }
        #if os(iOS)
            .navigationBarTitle(surat.nama_latin, displayMode: .inline)
        #else
            .navigationTitle(surat.nama_latin)
        #endif
    }
}

struct SuratDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SuratDetailView(surat: SuratModel.dummy()[0], detailSurat: SuratDetailModel.dummy())
    }
}
