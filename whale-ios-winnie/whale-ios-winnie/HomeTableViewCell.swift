//
//  HomeTableViewCell.swift
//  whale-ios-winnie
//
//  Created by Winnie Wen on 3/20/17.
//  Copyright © 2017 wiwen. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var questionLabel: UILabel!
    var userPicture: UIImageView!
    var videoView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        addSubview(nameLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//class AnswerCell: UICollectionViewCell {
//    @IBOutlet var nameLabel: UILabel!
//    @IBOutlet var profilePictureImageView: UIImageView!
//    @IBOutlet var questionLabel: UITextField!
//    
//    var answerCellViewModel: AnswerCellViewModel? {
//        didSet {
//            nameLabel.text = answerCellViewModel?.name
//            profilePictureImageView.image = answerCellViewModel?.profilePicture
//            questionLabel.text = answerCellViewModel.question
//}
