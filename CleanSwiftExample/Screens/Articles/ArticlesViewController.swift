import UIKit

protocol ArticlesDisplayLogic: AnyObject {
    func displayData(data: [ArticleCellModel])
}

class ArticlesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - External vars
    private(set) var router: ArticlesRoutingLogic?
    
    // MARK: - Internal vars
    private var interactor: ArticlesBusinessLogic?
    private var dataToDisplay = [ArticleCellModel]()
    
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
        configureTableView()
        interactor?.fetchData()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.cellIdentifier)
    }
    
    private func setup() {
        let viewController = self
        let presenter = ArticlesPresenter()
        let interactor = ArticlesInteractor()
        let router = ArticlesRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
}

// MARK: - UITableViewDataSource & Delegate implementation
extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.cellIdentifier, for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }
        cell.setup(data: dataToDisplay[indexPath.row])
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ArticlesViewController: ArticleCellDelegate {
    func didArticleTap(articleId: Int) {
        router?.navigateToDetails(articleId: articleId)
    }
}

extension ArticlesViewController: ArticlesDisplayLogic {
    func displayData(data: [ArticleCellModel]) {
        dataToDisplay.removeAll()
        dataToDisplay.append(contentsOf: data)
        tableView.reloadData()
    }
}
