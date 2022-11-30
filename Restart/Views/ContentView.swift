//
//  ContentView.swift
//  Restart
//
//  Created by kenjimaeda on 29/11/22.
//

import SwiftUI

struct ContentView: View {
	//https://serialcoder-dev.translate.goog/text-tutorials/swiftui/using-the-appstorage-property-wrapper-in-swiftui/?_x_tr_sl=en&_x_tr_tl=pt&_x_tr_hl=pt-BR&_x_tr_pto=sc
	//antigo userDefaults
	@AppStorage("onboarding") var onboardingView: Bool = true
	
	var body: some View {
		
		ZStack {
			
			if (onboardingView) {
				OnboardingView()
			}else {
				HomeScreen()
			}
			
		}//: ZStack
		
		
	}
	
	struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
			ContentView()
		}
	}
}
