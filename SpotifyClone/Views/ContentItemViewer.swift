//
//  ContentItemViewer.swift
//  SpotifyClone
//
//  Created by mac on 1/30/21.
//

import SwiftUI

struct ContentItemViewer: View {
    var topSpacer_height: CGFloat = 300
    
    var playButton_topPosition_offset: CGFloat = -222
    @State var playButton_offset: CGFloat = 250
    
    var backgroundColor = Color.init(red: 61/255, green: 89/255, blue: 155/255)
        
    var body: some View {
        ZStack{
            // Layer 0: background
            LinearGradient(
                gradient: Gradient(colors: [backgroundColor, backgroundColor, Color.black, Color.black]),
                startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // Layer 1: Song info
            VStack{
                Spacer()
                    .frame(height:20)
                Image(systemName: "music.note")
                    .resizable()
                    .frame(width: topSpacer_height - 150, height: topSpacer_height - 150)
                Text("Title")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                
                Text("Subtitle")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .medium))
                Spacer()
            }
            
            //Layer 2: List of Songs
            ScrollView{
                GeometryReader{
                    geo -> AnyView? in
                    let offset = geo.frame(in: .global).minY
                    if (offset > playButton_topPosition_offset) {
                        self.playButton_offset = offset
                    }
                    else{
                        self.playButton_offset = playButton_topPosition_offset
                    }
                    return nil
                }
                
                VStack(spacing:0){
                    HStack{
                        Spacer()
                            .frame(height:topSpacer_height)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(
                                        colors:
                                            [Color.clear,
                                             Color.clear,
                                             Color.clear,
                                             Color.clear,
                                             Color.black]),
                                    startPoint: .top, endPoint: .bottom))
                    }
                    VStack{
                        ForEach(0..<40){ indicator in
                            lImage_Text_rImage()
                        }
                    }
                    .background(Color.black)
                }.background(Color.clear)
            }
            
            // Secondary background
            VStack{
                LinearGradient(gradient: Gradient(colors: [backgroundColor, Color.clear]), startPoint: .top, endPoint: .bottom)
                    .frame(height:300)
                Spacer()
            }.edgesIgnoringSafeArea(.all)
            
            // Layer 3: Play Button
            VStack{
                Spacer()
                    .frame(height: playButton_offset + 222)
                
                HStack{
                    if (playButton_offset > playButton_topPosition_offset) {
                        Text("PLAY")
                    }
                    else{
                        Image(systemName: "play.fill")
                    }
                }
                .frame(width: get_playButton_width(), height:50)
                .background(Color.init(red: 30/255, green: 215/255, blue: 96/255)) // spotify color
                .foregroundColor(.white)
                .cornerRadius(25)
                .font(.system(size: 20, weight: .bold))
                .shadow(radius: 20)
                Spacer()
            }
            
            // Layer 4: Stationary buttons
            VStack{
                HStack{
                    Image(systemName: "chevron.left")
                        .frame(width: 50, height: 50)
                        .background(Color.gray)
                        .cornerRadius(25)
                        .padding(.leading)
                    Spacer()
                    Image(systemName: "ellipsis")
                        .frame(width: 50, height: 50)
                        .background(Color.gray)
                        .cornerRadius(25)
                }
                .foregroundColor(.white)
                .padding(.trailing)
                Spacer()
            }
            
            // Observer layer
//            VStack{
//                Spacer()
//                Text("\(playButton_offset)")
            //                    .foregroundColor(.let)
//            }
        }
    }
    
    func get_playButton_width() -> CGFloat{
        if (playButton_offset > -112){
            return 240
        }
        else if (playButton_offset <= -222){
            return 50
        }
        else{ // 110 = 222 - 112; 190 = 240 - 50
            let width: CGFloat =
                240 - 190 * (-1 * playButton_offset - 110) / 110
            return width
        }
    }
}

struct ContentItemViewer_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemViewer()
    }
}
