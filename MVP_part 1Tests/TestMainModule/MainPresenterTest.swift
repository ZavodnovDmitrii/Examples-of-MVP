
import XCTest
@testable import MVP_part_1

class MockView: MainViewProtocol {
    var title: String?
    func setGreeting(greeting: String) {
        self.title = greeting
    }
}

class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var person: Comment!
    var presenter: MainPresenter!
    
    override func setUp() {
        view = MockView()
        person = Comment(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }
    
    override func tearDown() {
        view = nil
        person = nil
        presenter = nil
    }
    
    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "View not nil")
        XCTAssertNotNil(person, "Person not nil")
        XCTAssertNotNil(presenter, "Presenter not nil")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.title, "Baz Bar")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }
}
