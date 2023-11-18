//
//  Tag.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import SwiftUI

struct Tag: View {
    var label: String
    
    var body: some View {
        Text(label)
            .font(.system(size: 16))
            .padding(.leading, 14)
            .padding(.trailing, 30)
            .padding(.vertical, 8)
            .background (
                ZStack(alignment: .trailing) {
                    Capsule()
                        .fill(.green.opacity(0.3))
                    Button {
                        // remove tag
                    } label:{
                        Image(systemName: "xmark")
                            .frame(width: 15, height: 15)
                            .padding(.trailing, 8)
                            .foregroundColor(.white)
                    }
                }
            )
    }
}

extension String{
    func getSize() -> CGFloat{
        let font = UIFont.systemFont(ofSize: 16)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size.width
    }
}

#Preview {
    Tag(label: "Greek")
}
