//
//  ArticleTableViewCell.swift
//  CleanSwiftExample
//
//  Created by Илья on 08.06.2022.
//

import UIKit

protocol ArticleCellDelegate: AnyObject {
    func didArticleTap(articleId: Int)
}

class ArticleTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "ArticleTableViewCell"
    
    // MARK: - External vars
    weak var delegate: ArticleCellDelegate?
    
    // MARK: - Internal vars
    private var articleId: Int?
    
    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(data: ArticleCellModel) {
        articleId = data.articleId
        titleLabel.text = data.titleText
        bodyLabel.text = data.bodyText
    }
    
    @IBAction func didNextTap(_ sender: Any) {
        guard let articleId = articleId else { return }

        delegate?.didArticleTap(articleId: articleId)
    }
}
