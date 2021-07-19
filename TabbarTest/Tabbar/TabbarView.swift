// 
//  TabbarView.swift
//
//  Created by Den Jo on 2021/04/07.
//  Copyright © nilotic. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
   
    // MARK: - Value
    // MARK: Private
    @State private var tabBarHeight: CGFloat = 0
    @State private var isAccessoryViewHidden = false
    @State private var selectionIndex: Int?  = nil
    @State private var selection: TabbarType = .graph1
    
    private let tabBarColor = #colorLiteral(red: 0.178262651, green: 0.1638437212, blue: 0.1773374081, alpha: 1)
    
    
    // MARK: - Initializer
    init() {
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.178262651, green: 0.1638437212, blue: 0.1773374081, alpha: 1)
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                NavigationView {
                    TabView(selection: $selection) {
                        NavigationLink(destination: depth2View, tag: TabbarType.graph1.rawValue, selection: $selectionIndex) {
                            depth2Button
                        }
                        .tabItem {
                            TabBarItem(type: .graph1, selection: $selection)
                        }
                        .tag(TabbarType.graph1)
                        .background(TabBar { tabBarHeight = $0.bounds.height - proxy.safeAreaInsets.bottom })
                        
                        
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .tabItem {
                                TabBarItem(type: .graph2, selection: $selection)
                            }
                            .tag(TabbarType.graph2)
                        
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .tabItem {
                                TabBarItem(type: .graph3, selection: $selection)
                            }
                            .tag(TabbarType.graph3)
                        
                        
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .tabItem {
                                TabBarItem(type: .graph4, selection: $selection)
                            }
                            .tag(TabbarType.graph4)
                        
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .tabItem {
                                TabBarItem(type: .graph5, selection: $selection)
                            }
                            .tag(TabbarType.graph5)
                    }
                    .navigationTitle(selection.title)
                }
                .onAppear {
                    isAccessoryViewHidden = false
                }
                
                
                if !isAccessoryViewHidden {
                    TabBarAccessoryView(data: $selection, tabBarHeight: $tabBarHeight)
                }
            }
        }
    }
    
    // MARK: Private
    private var depth2View: some View {
        ZStack {
            Text("Depth 2")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.gray)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Depth 2")
    }
    
    private var depth2Button: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)), .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Button(action: {
                selectionIndex = 0
                isAccessoryViewHidden = true
                
            }) {
                Text("Depth 2")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold))
            }
        }
    }
}


#if DEBUG
struct TabbarView_Previews: PreviewProvider {
    
    static var previews: some View {
        let view = TabbarView()
        
        Group {
            view
                .previewDevice("iPhone 8")
                .previewDisplayName("iPhone 8      ( 375 x 667  |   4.7 inch )")
            
            /*
            view
                .previewDevice("iPhone 8 Plus")
                .previewDisplayName("iPhone 8 Plus      ( 414 x 736  |   5.5 inch )")
            
            view
                .previewDevice("iPhone X")
                .previewDisplayName("iPhone X     ( 375 x 812  |   5.85 inch )")
            
            view
                .previewDevice("iPhone 11")
                .previewDisplayName("iPhone 11     ( 414 x 896  |   6.1 inch )")
            
            view
                .previewDevice("iPhone 11 Pro")
                .previewDisplayName("iPhone 11 Pro    ( 375 x 812  |   5.85 inch )")
            
            view
                .previewDevice("iPhone 12 mini")
                .previewDisplayName("iPhone 12 mini     ( 375 x 812  |   5.42 inch )")
                
            view
                .previewDevice("iPhone 12")
                .previewDisplayName("iPhone 12      ( 390 x 844  |   6.06 inch )")
            
            view
                .previewDevice("iPhone 12 Pro Max")
                .previewDisplayName("iPhone 12 Pro Max     ( 428 x 926  |   6.68 inch )")
            
            
            
            view
                .previewDevice("iPad Pro (9.7-inch)")
                .previewDisplayName("iPad Pro (9.7-inch)     ( 2048 x 1536  |   9.7 inch )")
            
            view
                .previewDevice("iPad Pro (11-inch)")
                .previewDisplayName("iPad Pro (11-inch)     ( 1668 x 2388  |   6.68 inch )")
            
            view
                .previewDevice("iPad Pro (12.9-inch)")
                .previewDisplayName("iPad Pro (12.9-inch)     ( 2732 x 2048  |   6.68 inch )")
             */
        }
        .preferredColorScheme(.dark)
    }
}
#endif
