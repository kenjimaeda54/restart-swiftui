//
//  OnboardingView.swift
//  Restart
//
//  Created by kenjimaeda on 29/11/22.
//

import SwiftUI

struct OnboardingView: View {
	@AppStorage("onboarding") var onboardingView: Bool = true
	
	func handleAppStorage() {
		onboardingView = false
	}
	
	var body: some View {
		
		ZStack{
			//background para zstack
			Color("ColorBlue")
				.edgesIgnoringSafeArea(.all)
		  
			Spacer()
			VStack(spacing:20){
				VStack(spacing: 0) {
					Text("Share")
						.font(.system(size: 60))
						.fontWeight(.bold)
						.foregroundColor(.white)
					
					Text("""
			Its not how much we give but how much love put into giving
			""")
					.font(.title3)
					.foregroundColor(.white)
					.multilineTextAlignment(.center)
					.padding(.horizontal,35)
				
					
				}// HEADER
			
				ZStack {
					ZStack {
						Circle()
							.stroke(.white.opacity(0.2), lineWidth: 40)
							.frame(width: 260,height: 260,alignment: .center)
						Circle()
							.stroke(.white.opacity(0.2),lineWidth: 80)
							.frame(width: 260,height: 260,alignment: .center)
					}//: Zstack
					Image("character-1")
						.resizable()
						.scaledToFit()
				}//: CENTER
				
			Spacer()
				ZStack {
	
					   Capsule()
							.fill(Color.white.opacity(0.2))
							.padding(8)
					  
					  Capsule()
						.fill(Color.white.opacity(0.2))
						.padding(8)
					
					Text("Get start")
						.font(.system(size: 25))
						.foregroundColor(.white)
						.fontWeight(.bold)
						.offset(x:20)
					
					//HSTACK aqui e para empurrar o zstack
					HStack {
						ZStack {
							 Circle()
								.fill(Color("ColorRed"))
							
						}
						Spacer()
					}
					
					HStack {
						ZStack {
							 Circle()
								.fill(Color("ColorRed"))
							 Circle()
								.fill(.black.opacity(0.2))
								.padding(8)
							 Image(systemName: "chevron.right.2")
								.font(.system(size: 24))
								.foregroundColor(.white)
							
						}
						Spacer()
					}
					
					
			  }//: Footer
				.frame(height: 80,alignment: .center)
				.padding(8)
				.onTapGesture {
					 onboardingView = false
				}

			}//: VSTACK
			 
		}//: ZStack
				

			 
			
		}
		
}

struct OnboardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingView()
	}
}
