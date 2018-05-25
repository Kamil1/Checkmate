//
//  CMMetadataTableViewCell.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-14.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import UIKit

class CMMetadataTableViewCell: UITableViewCell {
    
    private var metadata: CMMetadata
    
    private var label: UILabel
    private var color: UIView
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.metadata = CMDirectory(name: "Init Dir", parent: nil)
        self.label = UILabel()
        self.color = UIView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        contentView.addSubview(color)
        color.translatesAutoresizingMaskIntoConstraints = false
        color.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        color.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        color.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        color.widthAnchor.constraint(equalToConstant: 8).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMetadata(metadata: CMMetadata) {
        self.metadata = metadata
        self.label.text = metadata.name
        self.accessoryType = metadata.type != .list ? .disclosureIndicator : .none
        self.color.backgroundColor = (metadata.type == .tag) ? (metadata as! CMTag).color : .clear
    }

}
