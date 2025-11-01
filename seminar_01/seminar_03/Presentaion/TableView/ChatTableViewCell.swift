//
//  ChatTableViewCell.swift
//  seminar_01
//
//  Created by 신혜연 on 11/1/25.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "ChatTableViewCell"
    
    // MARK: - UI Components

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .systemGray5
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        return label
    }()

    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .systemGray
        return label
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()

    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setStyle() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
    private func setUI() {
        contentView.addSubviews(
            profileImageView,
            nameLabel,
            locationLabel,
            messageLabel,
            thumbnailImageView
        )
    }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalTo(profileImageView)
        }
        
        locationLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(nameLabel)
        }
        
        messageLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.trailing.equalTo(thumbnailImageView.snp.leading).inset(8)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
}

extension ChatTableViewCell {
    func configure(chatRoom: ChatRoomModel) {
        profileImageView.image = chatRoom.profileImage
        nameLabel.text = chatRoom.name
        locationLabel.text = chatRoom.location
        messageLabel.text = chatRoom.lastMessage
        thumbnailImageView.image = chatRoom.thumbnail
    }
}

#Preview {
    ChatTableViewCell(frame: .zero)
}
