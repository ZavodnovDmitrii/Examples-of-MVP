
import Foundation

protocol MainViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, netWorkService: NetWorkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOfTheComment(comment: Comment?)
}

class MainPresenter: MainViewPresenterProtocol {
   
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let netWorkService: NetWorkServiceProtocol
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, netWorkService: NetWorkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.netWorkService = netWorkService
        self.router = router
        getComments()
    }
    
    func tapOfTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
    
    func getComments() {
        netWorkService.getComments { [weak self] (result) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
