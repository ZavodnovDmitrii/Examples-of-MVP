
import Foundation

protocol DetailViewProtocol: class {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, netWorkService: NetWorkServiceProtocol,router: RouterProtocol, comment: Comment)
    func setComment()
    func tapPopToRoot()
}

class DetailPresenter: DetailViewPresenterProtocol {

    weak var view: DetailViewProtocol?
    let netWorkService: NetWorkServiceProtocol!
    let comment: Comment?
    var router: RouterProtocol?
    
    required init(view: DetailViewProtocol, netWorkService: NetWorkServiceProtocol,router: RouterProtocol, comment: Comment) {
        self.view = view
        self.netWorkService = netWorkService
        self.router = router
        self.comment = comment
    }
    
    func tapPopToRoot() {
        router?.popToRoot()
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
}
