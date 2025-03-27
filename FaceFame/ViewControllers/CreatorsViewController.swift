//
//  CreatorsViewController.swift
//  FaceFame
//
//  Created by Samoilik Hleb on 27/03/2025.
//

import UIKit

struct TeamMember {
    var name: String
    var description: String
    var imageName: String
}

final class CreatorsViewController: UIViewController {
    
    @IBOutlet private var teamLeadImage: UIImageView!
    @IBOutlet private var developerOneImage: UIImageView!
    @IBOutlet private var developerTwoImage: UIImageView!
    
    @IBOutlet private var teamLeadDescription: UIStackView!
    @IBOutlet private var developerOneDescription: UIStackView!
    @IBOutlet private var developerTwoDescription: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer()
        
        setupTeamMembers()
        setupUI()
    }
    
    var teamMembers: [TeamMember] = []
    
    private func setupTeamMembers() {
        teamMembers = [
            TeamMember(name: "Глеб", description: "Творец экранов, заставил вход и главную страницу работать как одно целое — сделал невозможное возможным!", imageName: "Gleb"),
            TeamMember(name: "Василий", description: "Виртуоз кнопок и анимаций. Создал экран игры, где каждый клик — магия, а анимации — волшебство.", imageName: "Vasiliy"),
            TeamMember(name: "Александр", description: "Магистр DataSource и архитектор логики экранов. Все данные — под его контролем!", imageName: "Alex")
        ]
    }
    
    private func setupRoundedImages() {
        let imageViews = [teamLeadImage, developerOneImage, developerTwoImage]
        imageViews.forEach { $0?.makeRounded() }
    }
    
    private func setupUI() {
        let descriptions = [teamLeadDescription, developerOneDescription, developerTwoDescription]
        let imageViews = [teamLeadImage, developerOneImage, developerTwoImage]
        
        setupRoundedImages()
        
        for (index, member) in teamMembers.enumerated() {
            updateStackView(descriptions[index], with: member)
            if let imageView = imageViews[index] {
                imageView.image = UIImage(named: member.imageName)
            }
        }
    }
    
    private func updateStackView(_ stackView: UIStackView?, with member: TeamMember) {
        // Обновляем только текст в существующих UILabel в stackView
        guard let stackView = stackView else { return }
        
        let nameLabel = stackView.arrangedSubviews[0] as? UILabel
        let descriptionLabel = stackView.arrangedSubviews[1] as? UILabel
        
        nameLabel?.text = member.name
        descriptionLabel?.text = member.description
    }
}
