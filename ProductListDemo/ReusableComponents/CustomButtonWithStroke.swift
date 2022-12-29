//
//  CustomButtonWithStroke.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import SwiftUI

struct CustomButtonWithStroke: View {
    let name: String
    let backGroundcolor:Color
    let foreGroundcolor:Color
    var body: some View {
        if #available(iOS 15.0, *) {
            HStack{
                Spacer()
                Text(name)
                    .font(.custom("Roboto", size: 18))
                    .bold()
                Spacer()
                
            }
            .frame(height: 64)
            .background(backGroundcolor)
            .foregroundColor(foreGroundcolor)
            .cornerRadius(8)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.white)
            })
            .shadow(color: .black.opacity(0.2), radius: 7, x: 5, y: 7)
        } else {
            HStack{
                Spacer()
                Text(name)
                    .font(.custom("Roboto", size: 18))
                    .bold()
                Spacer()
                
            }
            .frame(height: 64)
            .background(backGroundcolor)
            .foregroundColor(foreGroundcolor)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.2), radius: 7, x: 5, y: 7)
        }
      
    }
}

struct CustomButtonWithStroke_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonWithStroke(name: "LIST", backGroundcolor: .black, foreGroundcolor: .white)
            .previewLayout(.sizeThatFits)
    }
}
