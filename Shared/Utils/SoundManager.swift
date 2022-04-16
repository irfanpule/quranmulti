//
//  SoundManager.swift
//  QuranMulti
//
//  Created by Muhammad Irfan on 16/04/22.
//

import AVFoundation
import AVFAudio


class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}
