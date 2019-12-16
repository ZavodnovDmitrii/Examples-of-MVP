
import UIKit

protocol AssemblyBuilderProtocol {
    func createMainBuilder(router: RouterProtocol) -> UIViewController
    func createDetailBuilder(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createMainBuilder(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let netWorkService = NetWorckService()
        let presenter = MainPresenter(view: view, netWorkService: netWorkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailBuilder(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let netWorkService = NetWorckService()
        let presenter = DetailPresenter(view: view, netWorkService: netWorkService, router: router, comment: comment!)
        view.presenter = presenter
        return view
    }
}
