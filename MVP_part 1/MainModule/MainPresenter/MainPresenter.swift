
import Foundation

protocol MainViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, netWorkService: NetWorkServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    let netWorkService: NetWorkServiceProtocol
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, netWorkService: NetWorkServiceProtocol) {
        self.view = view
        self.netWorkService = netWorkService
        getComments()
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
