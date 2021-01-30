//
//  lImage_Text_rImage.swift
//  SpotifyClone
//
//  Created by mac on 1/30/21.
//

import SwiftUI

struct lImage_Text_rImage: View {
    var body: some View {
        HStack{
            Image(systemName: "timelapse")
                .padding()
            Text("Title")
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding()
        .background(Color.black)
        .foregroundColor(.white)
    }
}

struct lImage_Text_rImage_Previews: PreviewProvider {
    static var previews: some View {
        lImage_Text_rImage()
    }
}
