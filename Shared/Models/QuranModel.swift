//
//  QuranModel.swift
//  QuranMulti-iOS
//
//  Created by Muhammad Irfan on 12/02/22.
//

import Foundation

enum NavigationItem {
  case quran
  case bookmarks
}

// api yang digunakan https://equran.id/apidev
struct SuratModel: Codable {
    var nomor: Int
    var nama: String
    var nama_latin: String
    var jumlah_ayat: Int
    var tempat_turun: String
    var arti: String
    var deskripsi: String
    var audio: String
}

struct AyatModel: Codable {
    var nomor: Int
    var ar: String
    var tr: String
    var idn: String
}

struct TafsirModel: Identifiable {
    var id = UUID()
    var ayat: Int
    var tafsir: String
}

struct SuratDetailModel: Codable {
    var ayat: [AyatModel]
    var status: Bool
}

extension SuratModel {
    static func dummy() -> [SuratModel] {
        return [
            SuratModel(nomor: 1, nama: "الفاتحة", nama_latin: "Al-Fatihah", jumlah_ayat: 7, tempat_turun: "mekah", arti: "Pembukaan", deskripsi: "Surat <i>Al Faatihah</i> (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang pertama-tama diturunkan dengan lengkap  diantara surat-surat yang ada dalam Al Quran dan termasuk golongan surat Makkiyyah. Surat ini disebut <i>Al Faatihah</i> (Pembukaan), karena dengan surat inilah dibuka dan dimulainya Al Quran. Dinamakan <i>Ummul Quran</i> (induk Al Quran) atau <i>Ummul Kitaab</i> (induk Al Kitaab) karena dia merupakan induk dari semua isi Al Quran, dan karena itu diwajibkan membacanya pada tiap-tiap sembahyang.<br> Dinamakan pula <i>As Sab'ul matsaany</i> (tujuh yang berulang-ulang) karena ayatnya tujuh dan dibaca berulang-ulang dalam sholat.", audio: "https://equran.id/content/audio/001.mp3"),
            SuratModel(nomor: 2, nama: "البقرة", nama_latin: "Al-Baqarah", jumlah_ayat: 286, tempat_turun: "madinah", arti: "Sapi", deskripsi: "Surat <i>Al Baqarah</i> yang 286 ayat itu turun di Madinah yang sebahagian besar diturunkan pada permulaan tahun Hijrah, kecuali ayat 281 diturunkan di Mina pada Hajji wadaa' (hajji Nabi Muhammad s.a.w. yang terakhir). Seluruh ayat dari surat Al Baqarah termasuk golongan Madaniyyah, merupakan surat yang terpanjang di antara surat-surat Al Quran yang di dalamnya terdapat pula ayat yang terpancang (ayat 282). Surat ini dinamai <i>Al Baqarah</i> karena di dalamnya disebutkan kisah penyembelihan sapi betina yang diperintahkan Allah kepada Bani Israil (ayat 67 sampai dengan 74), dimana dijelaskan watak orang Yahudi pada umumnya. Dinamai <i>Fusthaatul-Quran</i> (puncak Al Quran) karena memuat beberapa hukum yang tidak disebutkan dalam surat yang lain. Dinamai juga surat  <i>alif-laam-miim</i> karena surat ini dimulai dengan Alif-laam-miim.", audio: "https://equran.id/content/audio/002.mp3")
        ]
    }
}

extension AyatModel {
    static func dummy() -> [AyatModel] {
        return[
            AyatModel(nomor: 1, ar: "اِذَا جَاۤءَ نَصْرُ اللّٰهِ وَالْفَتْحُۙ", tr: "i<u>dzaa</u> j<u>aa</u>-a na<u>sh</u>ru <strong>al</strong>l<u>aa</u>hi wa<strong>a</strong>lfat<u>h</u><strong>u</strong>", idn: "Apabila telah datang pertolongan Allah dan kemenangan,"),
            AyatModel(nomor: 2, ar: "وَرَاَيْتَ النَّاسَ يَدْخُلُوْنَ فِيْ دِيْنِ اللّٰهِ اَفْوَاجًاۙ", tr: "wara-ayta <strong>al</strong>nn<u>aa</u>sa yadkhuluuna fii diini <strong>al</strong>l<u>aa</u>hi afw<u>aa</u>j<u>aa</u><strong>n</strong>", idn: "dan engkau melihat manusia berbondong-bondong masuk agama Allah,"),
            AyatModel(nomor: 3, ar: "فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُۗ اِنَّهٗ كَانَ تَوَّابًا ࣖ", tr: "fasabbi<u>h</u> bi<u>h</u>amdi rabbika wa<strong>i</strong>staghfirhu innahu k<u>aa</u>na taww<u>aa</u>b<u>aa</u><strong>n</strong>", idn: "maka bertasbihlah dalam dengan Tuhanmu dan mohonlah ampunan kepada-Nya. Sungguh, Dia Maha Penerima tobat.")
        ]
    }
}

extension SuratDetailModel {
    static func dummy() -> SuratDetailModel {
        let ayats = AyatModel.dummy()
        let detailSurat = SuratDetailModel(ayat: ayats, status: true)
        return detailSurat
    }
}

