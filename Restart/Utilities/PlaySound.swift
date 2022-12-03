//
//  PlaySound.swift
//  Restart
//
//  Created by kenjimaeda on 02/12/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?


func playSound(sound: String,type: String) {
	if let path = Bundle.main.path(forResource: sound, ofType: type) {
		do {
			 audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
			audioPlayer?.play()
		}catch {
			print("I cant play sound")
		}
		
		
	}
	
	
}
