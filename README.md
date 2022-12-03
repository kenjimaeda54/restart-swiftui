# Restart
Projeto relax para praticar animacoes em swfitui


## Feature
- Trabalhei com conceitos de textos dinamicos e conforme alterava sofrevia uma transicao na opacidade
- Para swifui entender que precissa renderizar novamente aquela arvore e preciso identificar com um id


```swift
	Text(textTitle)
			.foregroundColor(.white)
		 	.fontWeight(.bold)
			.font(.system(size: 45, design: .rounded)
      .transition(.opacity)
			.id(textTitle) 



```
##
- Para gerar animacao da maneira correta primerio inicio uma variavel como falso e no ciclo onApear a torno verdadeiro
- Abaixo um exemplo como funciona a logica
- Para garantir que meu status bar acompanhe caso o tema  do celular do usaurio,usei o metood preferredColorScheme

```swift

Image(systemName: "arrow.left.and.right.circle")
							.font(.system(size: 34,weight: .ultraLight))
							.foregroundColor(.white)
							.opacity(isAnimation ? 1 : 0)
							.animation(.easeInOut(duration: 1.7), value: isAnimation)
							.opacity(opacityIndicator)
							.offset(y: -17)
					})



.onAppear {
			isAnimation = true
		}
.preferredColorScheme(.dark) 

```
##
- Para lidar com efeitos paralax no swiftUI
- Usei o metodo gesture e dentro dele usei o recurso de abs
- Drag varia entre positivo e negativo,com abs so pego valor absoluto
- Exemplo abaixo a imagem sofreara no maximo 150 de distancia para amobs lados
- Com metodo rotationEffect ao realizar o drag a imagem fica parcialmetne rotacinada



```swift

@State var isAnimation = false
@State var imageOffesset: CGSize = .zero

	Image("character-1")
			.resizable()
      .scaledToFit()
			.animation(.easeOut(duration: 1), value: isAnimation)
			.rotationEffect(.degrees(Double(imageOffesset.width / 20)))
			.offset(x: imageOffesset.width , y: 0) //sem ofeste a imagem nao anda
			.gesture(
        DragGesture()
						.onChanged({ gestureEvent in
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

```
##
- Para conseguir usar o Spacer() precisamos de um HSStack ou VStack como no exemplo abaixo
- Outro fator importante e a diferenca entre Capsule e Circle para possibiitar a barra aumentar conforme arrastava o botao precisa usar capsule
- Repara que o frame e aumetnado dinamicamente usando buttonOffesset
- Pegar o tamanho da screen usei o metodo main.bounds.width

```swift
HStack {
	ZStack {
		Capsule()
				.fill(Color("ColorRed"))
				.padding(.vertical,4)
				.frame(width: buttonOffesset + 80)
							
	}
	Spacer()
}


//para aumetnar o frame
	@State var buttonWidth =  UIScreen.main.bounds.width - 50
	@State var buttonOffesset: CGFloat = 0

	.gesture(
			DragGesture()
				.onChanged({ gestureEvent in
							//buttonOffesset <= buttonWidth para garantir que o circulo não ultrapse o
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

```

##
- Para relaizar um time out e apos isto concluir uma acao pode usar o metodo asyncAfter
- No exemplo abaixo apos 3 segundos minha animcao sera verdadeira

```swift

Image("character-2")
					.resizable()
					.scaledToFit()
					.padding( .horizontal,25)
					.offset(y: isAnimation ? -35 : 35)
					.animation(
						Animation
							.easeInOut(duration: 4)
							.repeatForever(),
						value: isAnimation
						
	)


	.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
				isAnimation = true
			})
			
		}

```

##
- E possivel aplicar um overlay em cima dos zstack como exemplo abaixo
- Tambem realizei nesting de opacidades
- Cada opacidade depdende de uma variavel

```swift

.overlay(alignment: .bottom, content: {
		Image(systemName: "arrow.left.and.right.circle")
				.font(.system(size: 34,weight: .ultraLight))
				.foregroundColor(.white)
				.opacity(isAnimation ? 1 : 0)
				.animation(.easeInOut(duration: 1.7), value: isAnimation)
				.opacity(opacityIndicator)
				.offset(y: -17)
		})



```

##
- Meotdo para aplicar sound



```swift

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



```

## 
- Por fim utilizei o user defaults para mudar entre telas
- [User defaults](//https://serialcoder-dev.translate.goog/text-tutorials/swiftui/using-the-appstorage-property-wrapper-in-swiftui/?_x_tr_sl=en&_x_tr_tl=pt&_x_tr_hl=pt-BR&_x_tr_pto=sc) em swifui se comparta de maneira diferente 
- Bascimaente nao se diferencia os metodos get e setter
- Apenas instancio uma variavel ele recebera o valor casso possua,preciso sempre atribuir um valor casso nao possuir ele assumiara esse valor



```swift
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



```

















