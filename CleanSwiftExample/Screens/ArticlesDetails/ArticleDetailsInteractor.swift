import Foundation

protocol ArticleDetailsBusinessLogic {
    func fetchDetails()
}

protocol ArticleDetailsStoreProtocol: AnyObject {
    var articleId: Int { get set }
}

class ArticleDetailsInteractor {
    
    var articleId: Int = -1
}

extension ArticleDetailsInteractor: ArticleDetailsBusinessLogic {
    func fetchDetails() {
        print("articleId: \(articleId)")
    }
}
