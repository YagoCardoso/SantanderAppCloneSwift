//
//  NewsView.swift
//  Santander
//
//  Created by User on 21/08/23.
//

import SwiftUI

struct NewsView: View {
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        TabView{
            ForEach(viewModel.news, id: \.id){ news in
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 333, height: 115)
                    .background(.white)
                    .cornerRadius(6)
                    .shadow(color: .black.opacity(0.15), radius: 4.5, x: .zero,
                            y: 4)
                    .overlay {
                        HStack{
                            AsyncImage(from: URL(string:news.iconUrl), frame:
                                        CGSize(width: 44, height: 44)){image in image
                                    .renderingMode(.template)
                                    .background(Color.santanderRed)
                            }placeholder: {
                                ProgressView()
                            }
                            Text(news.description)
                                .font(.openSansSemiBold(size: 14))
                                .padding(.leading, 6.0)
                                .kerning(0.14)
                                .foregroundColor(Color(red: 0.38, green:0.38, blue: 0.38))
                        }
                        .padding(.all, 20.0)
                        }
                       
            }
        }
        .tabViewStyle(.page)
        .pageControlAppearance(backgroundColor: Color.santanderRed)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
