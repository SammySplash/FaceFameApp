//
//  TabBarController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 26/03/2025.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedIndex = 1
        delegate = self
        
        setupTabBarAppearance()
        transferData()
    }
    
    // MARK: - Navigation
    private func transferData() {
        viewControllers?.forEach {
            if let homeVC = $0 as? HomeViewController {
                homeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController,
                      let homeVC = navigationVC.topViewController as? HomeViewController {
                homeVC.user = user
            }
        }
    }
    
    // MARK: - Private methods
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        
        tabBar.alpha = 0.75
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        updateTabBarAppearance()
    }
    
    private func updateTabBarAppearance() {
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
        }
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateTabBarAppearance()
    }
}

