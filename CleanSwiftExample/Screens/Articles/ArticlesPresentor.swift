import Foundation

protocol ArticlesPresentationLogic {
    func presentData(data: [ArticleBackendModel])
}

class ArticlesPresenter {
    
    weak var viewController: ArticlesDisplayLogic?
}

// MARK: - Presentation logic
extension ArticlesPresenter: ArticlesPresentationLogic {
    
    func presentData(data: [ArticleBackendModel]) {
        let viewModel = data.map { model -> ArticleCellModel in
            let cellModel = ArticleCellModel(articleId: Int(model.articleId) ?? 0,
                                             titleText: model.name,
                                             bodyText: model.text)
            return cellModel
        }
        viewController?.displayData(data: viewModel)
    }
}
