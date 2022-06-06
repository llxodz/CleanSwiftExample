import UIKit

protocol ArticlesDisplayLogic {
    func displayData()
}

class ArticlesViewController: UIViewController {
    
    // MARK: - External vars
    
    // MARK: - Internal vars
    private var interactor: ArticlesBusinessLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchData()
    }
    
    private func setup() {
        let viewController = self
        let presenter = ArticlesPresenter()
        let interactor = ArticlesInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
}

extension ArticlesViewController: ArticlesDisplayLogic {
    func displayData() {
        
    }
}
