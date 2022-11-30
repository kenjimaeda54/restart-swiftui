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
		
		ZStack {
			Color("ColorBlue")
				.ignoresSafeArea(.all)
			VStack(spacing:20) {
				Spacer()
				VStack {
					  Text("Share")
						.foregroundColor(.white)
						.fontWeight(.bold)
						.font(.system(size: 45, design: .rounded))
					  
					 Text("""
								 Its not how much we give but how much love we put into giving
								""")
					 .multilineTextAlignment(.center)
					 .font(.title3)
					 .foregroundColor(.white)
					 .padding(.horizontal,45)
					
				}//HEADER
			  
				
				ZStack{
					ZStack {
						CircleGroupView(color: .white, opacity: 0.2)
             Image("character-1")
							.resizable()
							.scaledToFit()
							
					}
					
				}// Center
				Spacer()
				
				ZStack {
					Capsule()
						.fill(Color.white.opacity(0.2))
					 Capsule()
						.fill(Color.white.opacity(0.2))
						.padding(8)
						 
					//HSTACK aqui e para permitir usar propriedade
					//Spacer empurrar para final
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
								.fill(Color.black.opacity(0.2))
								.padding(4)
							Image(systemName: "chevron.right.2")
								.font(.system(size: 25))
								.foregroundColor(.white)
						}
						Spacer()
					}
					
				} //Footer
				.frame(height: 80,alignment: .center)
				.padding(.horizontal,25)
				.onTapGesture {
					onboardingView = false
				}
				
			}//VSTACK
			
		}//ZSTACK
		
		
	}
}

struct OnboardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingView()
	}
}
