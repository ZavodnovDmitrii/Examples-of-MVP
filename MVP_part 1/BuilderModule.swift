
import UIKit

protocol Builder {
    static func createMainBuilder() -> UIViewController
}

class MainBuilder: Builder {
    static func createMainBuilder() -> UIViewController {
        let view = MainViewController()
        let netWorkService = NetWorckService()
        let presenter = MainPresenter(view: view, netWorkService: netWorkService)
        view.presenter = presenter
        return view
    }
}
