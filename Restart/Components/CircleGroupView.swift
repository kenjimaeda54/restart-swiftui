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
	
	var body: some View {
		Circle()
			.stroke(color.opacity(opacity), lineWidth: 40)
			.frame(width: 260,height: 260,alignment: .center)
		Circle()
			.stroke(color.opacity(opacity), lineWidth:  80)
			.frame(width: 260,height: 260,alignment: .center)
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
