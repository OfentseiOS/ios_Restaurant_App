//
//  ViewController.swift
//  ios Restuarant App
//
//  Created by Ofentse Malebye on 2023/07/15.
//

import UIKit
import Lottie

struct Slide {
    let title: String
    let animationName: String
    let buttonColor: UIColor
    let buttonTitle: String
    
    static let collection: [Slide] = [
        .init(title: "Get your favourite food delivered to you under 30 minutes",
              animationName: "", buttonColor: .systemYellow, buttonTitle: "Next"),
        .init(title: "We serve only from choiced restuarants in your area", animationName: "", buttonColor: .systemGreen, buttonTitle: "Order Now")
        
    ]
}

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let slides: [Slide] = Slide.collection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
    }
    
    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
        
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cellid", for: indexPath) as! OnboardingCollectionViewCell
        let slide = slides[indexPath.item]
        cell.configure(with: slide)
    
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = collectionView.bounds.width
        let itemHeight = collectionView.bounds.height
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    func configure(with slide: Slide) {
        titleLabel.text = slide.title
        actionButton.backgroundColor = slide.buttonColor
        actionButton.setTitle(slide.buttonTitle, for: .normal)
        
        let animation = Animation.named("LottieDelivery")
        
        animationView.animation = animation
        animationView.loopMode = .loop
        
        if !animationView.isAnimationPlaying {
            animationView.play()
        }
    }
    
    @IBAction func actionButtonTapped() {
        
        
    }
}
