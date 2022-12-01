//
//  HomeScreen.swift
//  Restart
//
//  Created by kenjimaeda on 29/11/22.
//

import SwiftUI

struct HomeScreen: View {
	@AppStorage("onboarding") var onboarding = false
	//pegar o tamanho da tela

	
	func handleAppStorage() {
		onboarding = true;
	}
	
	var body: some View {
		
		VStack(spacing: 20) {
			Spacer()
			
			ZStack {
				CircleGroupView(color: .gray, opacity: 0.1)
				Image("character-2")
				.resizable()
				.scaledToFit()
				.padding( .horizontal,25)

				
			}
						
				Text("The time that leads to mastery is dependent on the intensity of our foucus")
				.font(.system(.title2,design: .rounded))
				.foregroundColor(Color.gray)
				.multilineTextAlignment(.center)
				.padding()
      
			Spacer()
			Button(action: handleAppStorage) {
				Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
					.font(.system(size: 20))
					.foregroundColor(.white)
				Text("Restart")
				
			}
			.buttonStyle(.borderedProminent)
			.buttonBorderShape(.capsule)
			.controlSize(.large)
			
		}//: ZStack
		
	}
}

struct HomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreen()
	}
}
