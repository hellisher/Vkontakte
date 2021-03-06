import UIKit

class MyAccountController: UIViewController {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var token: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let session = Session.instance
        
        userPhoto.image = session.userPhoto
        userName.text = session.userName
        userID.text = String(session.userID)
        token.text = session.token
        
    }
}
