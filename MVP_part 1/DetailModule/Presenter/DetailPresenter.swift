
import Foundation

protocol DetailViewProtocol: class {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, netWorkService: NetWorkServiceProtocol, comment: Comment)
    func setComment()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let netWorkService: NetWorkServiceProtocol!
    let comment: Comment?
    
    required init(view: DetailViewProtocol, netWorkService: NetWorkServiceProtocol, comment: Comment) {
        self.view = view
        self.netWorkService = netWorkService
        self.comment = comment
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
}
