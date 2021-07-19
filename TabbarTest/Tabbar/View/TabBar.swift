//
//  TabBar.swift
//  TabbarTest
//
//  Created by Den Jo on 2021/07/16.
//

import SwiftUI

struct TabBar: UIViewControllerRepresentable {
    
    // MARK: - Value
    // MARK: Public
    var completion: ((_ tabBar: UITabBar) -> Void)?
    
    // MARK: Private
    private let coordinator: Coordinator
    
    
    // MARK: - Initializer
    init(completion: ((_ tabBar: UITabBar) -> Void)?) {
        let coordinator = Coordinator()
        coordinator.completion = completion
        
        self.coordinator = coordinator
    }
    
    
    // MARK: - Function
    // MARK: Public
    func makeCoordinator() -> Coordinator {
        coordinator
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<TabBar>) -> UIViewController {
        coordinator
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TabBar>) {
        
    }


    // MARK: - Coordinator
    final class Coordinator: UIViewController {
        
        // MARK: - Value
        // MARK: Public
        var completion: ((_ tabBar: UITabBar) -> Void)?

        
        // MARK: - View Life Cycle
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            guard let tabBar = tabBarController?.tabBar else { return }
            completion?(tabBar)
        }
        
        override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            
            DispatchQueue.main.async {
                guard let tabBar = self.tabBarController?.tabBar else { return }
                self.completion?(tabBar)
            }
        }
    }
}
