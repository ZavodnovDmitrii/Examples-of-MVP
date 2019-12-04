
import UIKit

protocol Builder {
    static func createMainBuilder() -> UIViewController
    static func createDetailBuilder(comment: Comment?) -> UIViewController
}

class MainBuilder: Builder {
    
    static func createMainBuilder() -> UIViewController {
        let view = MainViewController()
        let netWorkService = NetWorckService()
        let presenter = MainPresenter(view: view, netWorkService: netWorkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailBuilder(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let netWorkService = NetWorckService()
        let presenter = DetailPresenter(view: view, netWorkService: netWorkService, comment: comment!)
        view.presenter = presenter
        return view
    }
}
