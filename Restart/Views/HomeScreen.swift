//
//  HomeScreen.swift
//  Restart
//
//  Created by kenjimaeda on 29/11/22.
//

import SwiftUI

struct HomeScreen: View {
	@AppStorage("onboarding") var onboarding = false
	
	func handleAppStorage() {
		onboarding = true;
	}
	
	var body: some View {
		
		VStack(spacing: 20) {
			
			Text("HomeScreen")
				.font(.largeTitle)
				.foregroundColor(.black)
			Button(action: handleAppStorage) {
				Text("Restart")
					.foregroundColor(.black)
			}
			
		}//: ZStack
		
	}
}

struct HomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreen()
	}
}
