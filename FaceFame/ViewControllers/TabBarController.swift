//
//  TabBarController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 26/03/2025.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        selectedIndex = 1
        delegate = self
        setupTabBarAppearance()
        updateTabBarAppearance(for: selectedIndex)
    }
    
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        
        tabBar.alpha = 0.75
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    private func updateTabBarAppearance(for selectedIndex: Int) {
        guard let items = tabBar.items else { return }
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        for (index, item) in items.enumerated() {
            let color: UIColor
            switch index {
            case 0: color = .systemYellow
            case 1: color = .systemBlue
            case 2: color = .systemGreen
            default: color = .gray
            }
            
            let iconColor = index == selectedIndex ? color : .gray
            
            item.image = item.image?.withRenderingMode(.alwaysOriginal).withTintColor(iconColor)
            
            if index == selectedIndex {
                appearance.stackedLayoutAppearance.selected.iconColor = color
                appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                    .foregroundColor: color
                ]
            } else {
                appearance.stackedLayoutAppearance.normal.iconColor = .gray
                appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                    .foregroundColor: UIColor.gray
                ]
            }
        }
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateTabBarAppearance(for: selectedIndex)
    }
}

