import Foundation

protocol ArticlesBusinessLogic {
    func fetchData()
}

class ArticlesInteractor {
    
    var presenter: ArticlesPresentationLogic?
}

// MARK: - Business logic
extension ArticlesInteractor: ArticlesBusinessLogic {
    
    func fetchData() {
        var backendResponse = [ArticleBackendModel]()
        let model = ArticleBackendModel(articleId: "0",
                                        name: "Lorem ipsum",
                                        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                                        rating: 5,
                                        symbolCount: 1200)
        
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        
        presenter?.presentData(data: backendResponse)
    }
}
