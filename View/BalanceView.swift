//
//  BalanceView.swift
//  Santander
//
//  Created by Marcelo Junior on 30/07/23.
//

import SwiftUI

struct BalanceView: View {
    
    @StateObject var viewModel = BalanceViewModel()
    
    @State private var cardClosed = true
    @State private var isRotation = 180.0
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(.clear)
            .background(.white)
            .frame(width: 333, height: cardClosed ? 75 : 250)
            .cornerRadius(6)
            .shadow(color: .black.opacity(0.15), radius: 4.5, x: .zero, y: 4)
            .overlay(alignment: .topLeading, content: {
                VStack {
                    
                    VStack(alignment: .leading){
                        HStack{
                            Image("money_icon")
                                .renderingMode(.template)
                                .foregroundColor(.santanderRed)
                                .frame(width: 25, height: 25)
                            
                            Text("Saldo Disponível")
                                .font(.openSansSemiBold(size: 18))
                                .padding(.leading)
                                .kerning(0.18)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image("card_balance_icon")
                                .rotationEffect(.degrees(isRotation))
                                .frame(width: 23.2374, height: 11.65924)
                                .onTapGesture {
                                    withAnimation {
                                        isRotation = cardClosed ? 360.0 : 180.0
                                        cardClosed.toggle()
                                    }
                                }
                        }
                        if !cardClosed {
                            VStack (alignment: .leading) {
                                Text(viewModel.accountBalance)
                                    .font(.openSansBold(size: 32.4))
                                    .kerning(0.324)
                                    .foregroundColor(.black)
                                Text(viewModel.balanceAndLimit)
                                    .font((.openSansSemiBold(size: 18)))
                                    .kerning(0.18)
                                    .foregroundColor(.black)
                            }
                            .padding(.top, 17.0)
                        }
                    }
                    if !cardClosed {
                        VStack(alignment: .center) {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 283, height: 2)
                                .background(Color.santanderGray)
                                .cornerRadius(75)
                            
                            Text("Ver extrato")
                                .font(.openSansSemiBold(size: 18))
                                .kerning(0.18)
                                .foregroundColor(Color.santanderRed)
                                .padding(.top, 4.0)
                        }
                        .padding(.top, 32.0)
                    }
                }
                .padding([.top, .leading, .trailing], 25.0)
            })
        
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
