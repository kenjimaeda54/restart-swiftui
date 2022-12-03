//
//  OnboardingView.swift
//  Restart
//
//  Created by kenjimaeda on 29/11/22.
//

import SwiftUI

struct OnboardingView: View {
	@AppStorage("onboarding") var onboardingView: Bool = true
	@State var buttonWidth =  UIScreen.main.bounds.width - 50
	@State var buttonOffesset: CGFloat = 0
	@State var isAnimation = false
	@State var imageOffesset: CGSize = .zero
	@State var opacityIndicator = 1.0
	@State var textTitle = "Share."

	//https://www.hackingwithswift.com/example-code/uikit/how-to-generate-haptic-feedback-with-uifeedbackgenerator
	//gerar vibracoes 
	let hapticFeedback = UINotificationFeedbackGenerator()
	
	func handleAppStorage() {
		playSound(sound: "chimeup", type: "mp3")
		hapticFeedback.notificationOccurred(.success)
		onboardingView = false
		
	}
	
	var body: some View {
		
		ZStack {
			Color("ColorBlue")
				.ignoresSafeArea(.all)
			VStack(spacing:20) {
				Spacer()
				VStack {
					Text(textTitle)
						.foregroundColor(.white)
						.fontWeight(.bold)
						.font(.system(size: 45, design: .rounded))
						.transition(.opacity)
						.id(textTitle) //isso e importante para swiftui tratar como
					//views diferentes assim meu transition funciona
					
					Text("""
 Its not how much we give but how much love we put into giving
 """)
					.multilineTextAlignment(.center)
					.font(.title3)
					.foregroundColor(.white)
					.padding(.horizontal,45)
					
				}//HEADER
				.opacity(isAnimation ? 1 : 0)
				.offset(y: isAnimation ? 0 : -45)
				.animation(.easeIn(duration: 1), value: isAnimation)
				
				
				ZStack{
					ZStack {
						CircleGroupView(color: .white, opacity: 0.2)
							.offset(x: imageOffesset.width * -1) //andar acontrario da imagem
							.blur(radius: abs(imageOffesset.width / 5))
							.animation(.easeOut(duration: 1), value: imageOffesset)
						
						Image("character-1")
							.resizable()
							.scaledToFit()
							.animation(.easeOut(duration: 1), value: isAnimation)
							.rotationEffect(.degrees(Double(imageOffesset.width / 20)))
							.offset(x: imageOffesset.width , y: 0) //sem ofeste a imagem nao anda
							.gesture(
								DragGesture()
									.onChanged({ gestureEvent in
										//valor absoluto,porque quando arrastar
										//imagem para esquerda sera negativo
										//entao com abs ficar positivo
										if abs(imageOffesset.width) <= 150 {
											imageOffesset = gestureEvent.translation
											
										}
										
										withAnimation(.linear(duration: 1)) {
											opacityIndicator = 0;
											textTitle = "Give."
										}
										
									})
								
									.onEnded({ _ in
										imageOffesset = .zero;
										
										withAnimation(.linear(duration: 1)) {
											opacityIndicator = 1.0;
											textTitle = "Share."
											
										}
										
									})
							)
					}
					.overlay(alignment: .bottom, content: {
						Image(systemName: "arrow.left.and.right.circle")
							.font(.system(size: 34,weight: .ultraLight))
							.foregroundColor(.white)
							.opacity(isAnimation ? 1 : 0)
							.animation(.easeInOut(duration: 1.7), value: isAnimation)
							.opacity(opacityIndicator)
							.offset(y: -17)
					})
					
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
							Capsule() //capsule e tipo barra
								.fill(Color("ColorRed"))
								.padding(.vertical,4)
								.frame(width: buttonOffesset + 80)
							
						}
						Spacer()
					}
					
					Text("Get Start")
						.font(.system(size: 30))
						.foregroundColor(.white)
						.offset(x:20)
					
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
						.offset(x: buttonOffesset)
						
						Spacer()
					}
					
				} //Footer
				.opacity(isAnimation ? 1 : 0 )
				.offset(y: isAnimation ? -45 : 0)
				.animation(.easeInOut(duration: 1), value: isAnimation)
				.frame(width: buttonWidth,height: 80,alignment: .center)
				.padding(.horizontal,25)
				.gesture(
					DragGesture()
						.onChanged({ gestureEvent in
							//buttonOffesset <= buttonWidth para garantir que o circulo não ultrapse o
							//capsule
							if gestureEvent.translation.width > 0 && buttonOffesset <= buttonWidth {
								buttonOffesset = gestureEvent.translation.width
							}
							
							
						})
						.onEnded({ _ in
							withAnimation(.easeOut(duration: 0.4)) {
								if buttonWidth / 2 > buttonOffesset {
			
									hapticFeedback.notificationOccurred(.warning)
									buttonOffesset = 0
								}else {
									buttonOffesset = buttonWidth - 80
									handleAppStorage()
								}
							}
							
						})
					
				)
				
				
				
			}//VSTACK
			
		}//ZSTACK
		//precisas iniciar false e modificar no fluxo para true
		.onAppear {
			isAnimation = true
		}
		.preferredColorScheme(.dark) //garanto que a barra estados ira se comportar da maneira correta caso muda para black
		
	}
}

struct OnboardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingView()
	}
}
