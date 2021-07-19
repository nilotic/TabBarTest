//
//  TabBarAccessoryView.swift
//  TabbarTest
//
//  Created by Den Jo on 2021/07/16.
//

import SwiftUI

struct TabBarAccessoryView: View {
    
    // MARK: - Value
    // MARK: Public
    @Binding var data: TabbarType
    @Binding var tabBarHeight: CGFloat
    
    // MARK: Private
    @State private var keyword = ""
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        VStack {
            ZStack {
                switch data {
                case .graph1:   graph1View
                case .graph2:   graph2View
                case .graph3:   graph3View
                case .graph4:   graph4View
                case .graph5:   graph5View
                }
            }
            .padding()
            .background(Color(#colorLiteral(red: 0.178262651, green: 0.1638437212, blue: 0.1773374081, alpha: 1)))
            .clipShape(RoundedCorner(radius: 35, corners: [.topLeft, .topRight]))
            
            Spacer()
                .frame(height: tabBarHeight)
        }
        .animation(.easeInOut(duration: 0.38))
    }
    
    
    // MARK: Private
    private var graph1View: some View {
        VStack {
            Color.clear
                .frame(height: 10)
                .cornerRadius(20)
        }
        .padding(.horizontal)
    }
    
    private var graph2View: some View {
        VStack {
            HStack(spacing: 20) {
                Text("자주")
                
                Text("최근")
                    .foregroundColor(Color(#colorLiteral(red: 0.3580661118, green: 0.3484761715, blue: 0.3574236035, alpha: 1)))
                
                Text("친구")
                    .foregroundColor(Color(#colorLiteral(red: 0.3580661118, green: 0.3484761715, blue: 0.3574236035, alpha: 1)))
                
                Text("계좌")
                    .foregroundColor(Color(#colorLiteral(red: 0.3580661118, green: 0.3484761715, blue: 0.3574236035, alpha: 1)))
                
                Spacer()
            }
            .font(.system(size: 25, weight: .bold))
            
            
            // Search
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.horizontal)
                
                TextField("Search something", text: $keyword)
            }
            .frame(height: 42)
            .background(Color.black)
            .cornerRadius(20)
            
        }
        .padding(.horizontal)
    }
    
    private var graph3View: some View {
        VStack(spacing: 0) {
            Text("카카오페이머니")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color(#colorLiteral(red: 0.82077986, green: 0.8112558126, blue: 0.8201166987, alpha: 1)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            
            HStack(spacing: 0) {
                Text("kakaopay")
                    .font(.system(size: 20))
                    .foregroundColor(Color(#colorLiteral(red: 0.9933149219, green: 0.9838165641, blue: 0.9926452041, alpha: 1)))
                
                Text("money")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.9958651662, blue: 1, alpha: 1)))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 18)
            
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                    .foregroundColor(.white)
                
                HStack(spacing: 0) {
                    ForEach(0..<35, id: \.self) { i in
                        Color.black
                            .frame(width: CGFloat((1...5).randomElement() ?? 1), height: 80)
                            .padding(EdgeInsets(top: 0, leading: CGFloat((3...8).randomElement() ?? 1), bottom: 0, trailing: 0))
                    }
                }
            }
            .padding(.vertical)
            .frame(height: 150)
            
            
            ZStack {
                GeometryReader { proxy in
                    HStack(spacing: 0) {
                        Text("결제")
                            .frame(width: proxy.size.width / 3, height: 40)
                            .background(Color(#colorLiteral(red: 0.178262651, green: 0.1638437212, blue: 0.1773374081, alpha: 1)))
                            .cornerRadius(20)
                        
                        Text("멤버십")
                            .frame(width: proxy.size.width / 3, height: 40)
                            .cornerRadius(20)
                        
                        Text("송금받기")
                            .frame(width: proxy.size.width / 3, height: 40)
                            .cornerRadius(20)
                    }
                    .padding(1)
                }
            }
            .background(Color.black)
            .cornerRadius(21)
            .frame(height: 42)
            .padding(.top, 10)
        }
    }
    
    private var graph4View: some View {
        ZStack {
            GeometryReader { proxy in
                HStack(spacing: 0) {
                    Text("결제")
                        .frame(width: proxy.size.width / 3, height: 40)
                        .background(Color(#colorLiteral(red: 0.178262651, green: 0.1638437212, blue: 0.1773374081, alpha: 1)))
                        .cornerRadius(20)
                    
                    Text("멤버십")
                        .frame(width: proxy.size.width / 3, height: 40)
                        .cornerRadius(20)
                    
                    Text("송금받기")
                        .frame(width: proxy.size.width / 3, height: 40)
                        .cornerRadius(20)
                }
                .padding(1)
            }
        }
        .background(Color.black)
        .cornerRadius(21)
        .frame(height: 42)
        .padding(.top, 10)
    }
    
    private var graph5View: some View {
        VStack {
            Color.clear
                .frame(height: 10)
                .cornerRadius(20)
        }
        .padding(.horizontal)
    }
}

#if DEBUG
struct TabBarAccessoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        let view = VStack(spacing: 0) {
            Spacer()
                .frame(maxHeight: .infinity)
            
            TabBarAccessoryView(data: .constant(.graph4), tabBarHeight: .constant(88))
        }
        
        Group {
            view
                .previewDevice("iPhone 12")
                .preferredColorScheme(.dark)
        }
    }
}
#endif
