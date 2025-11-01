//
//  FeedCollectionViewCell.swift
//  seminar_01
//
//  Created by 신혜연 on 11/1/25.
//

import UIKit
import SnapKit

protocol FeedCollectionViewCellDelegate: AnyObject {
    func didTapScrapButton(_ cell: FeedCollectionViewCell)
}

final class FeedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "FeedCollectionViewCell"
    
    weak var delegate: FeedCollectionViewCellDelegate?
    
    // MARK: - UI Components
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .systemGray6
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .orange
        return label
    }()
    
    let scrapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "emptyHeart"), for: .normal)
        button.setImage(UIImage(named: "redHeart"), for: .selected)
        return button
    }()
    
    // MARK: - Initialization
    
        override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func setStyle() {
        contentView.backgroundColor = .white
    }
    
    private func setUI() {
        contentView.addSubviews(
            itemImageView,
            nameLabel,
            priceLabel,
            scrapButton
        )
        
        itemImageView.addSubview(scrapButton)
    }
    
    private func setLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.height.equalTo(itemImageView.snp.width)
        }
        
        scrapButton.snp.makeConstraints {
            $0.trailing.equalTo(itemImageView).inset(8)
            $0.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(3)
            $0.horizontalEdges.equalTo(itemImageView).inset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalTo(itemImageView).inset(8)
        }
        
//        scrapButton.snp.makeConstraints {
//            $0.bottom.trailing.equalToSuperview().inset(10)
//            $0.size.equalTo(16)
//        }
    }
    
    private func setAddTarget() {
        scrapButton.addTarget(self, action: #selector(scrapButtonTapped), for: .touchUpInside)
    }
    
    public func configure(feed: FeedModel) {
        itemImageView.image = feed.itemImg
        nameLabel.text = feed.name
        priceLabel.text = feed.price
        scrapButton.isSelected = feed.isScrap
    }
    
    @objc private func scrapButtonTapped() {
//        scrapButton.isSelected.toggle() // 재사용되면서 다시 해제됨
        delegate?.didTapScrapButton(self)
    }
}
