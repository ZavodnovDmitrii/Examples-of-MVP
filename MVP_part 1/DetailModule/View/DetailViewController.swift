
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var CommentLabel: UILabel!
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           presenter.setComment()
       }
    
    @IBAction func tapBackActionButton(_ sender: Any) {
        presenter.tapPopToRoot()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        CommentLabel.text = comment?.body
    }
}
