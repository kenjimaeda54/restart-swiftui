//
//  CircleGroupView.swift
//  Restart
//
//  Created by kenjimaeda on 29/11/22.
//

import SwiftUI

struct CircleGroupView: View {
	@State var color: Color
	@State var opacity: Double
	@State var isAnimation = false
	
	var body: some View {
		ZStack {
			Circle()
			.stroke(color.opacity(opacity), lineWidth: 40)
			.frame(width: 260,height: 260,alignment: .center)
		Circle()
			.stroke(color.opacity(opacity), lineWidth:  80)
			.frame(width: 260,height: 260,alignment: .center)
		 
		}
		.opacity(isAnimation ? 1 : 0)
		.blur(radius: isAnimation ? 0 : 10)
		.scaleEffect(isAnimation ? 1 : 0.5)
		.animation(.easeOut(duration: 1), value: isAnimation)
		.onAppear {
				isAnimation = true
			}
	}
	
}

struct CircleGroupView_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color("ColorBlue")
			.edgesIgnoringSafeArea(.all)
			CircleGroupView(color: .white, opacity: 0.2)
				
		}
		
	}
}
