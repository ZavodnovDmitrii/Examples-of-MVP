
import UIKit

protocol Builder {
    static func createMainBuilder() -> UIViewController
}

class MainBuilder: Builder {
    static func createMainBuilder() -> UIViewController {
        let view = MainViewController()
        let person = Person(firstName: "David", lastName: "Blain")
        let presenter = MainPresenter(view: view, person: person)
        view.presenter = presenter
        return view
    }
}
