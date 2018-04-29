import UIKit

protocol AddBirthdayViewControllerDelegate {
  func addBirthdayViewController(_ addBirthdayViewController: AddBirthdayViewController, didAddBirthday birthday: Birthday)
}

class AddBirthdayViewController: UIViewController {

  // Элементы интерфейса
  @IBOutlet var firstNameTextField: UITextField!
  @IBOutlet var lastNameTextField: UITextField!
  @IBOutlet var birthdayPicker: UIDatePicker!
  
  var delegate: AddBirthdayViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Человек не может родиться в будущем
    birthdayPicker.maximumDate = Date()
  }
  
  @IBAction func saveTapped(_ sender: UIBarButtonItem) {
    
    // Данные из формы
    let firstName = firstNameTextField.text ?? ""
    let lastName = lastNameTextField.text ?? ""
    let birthDate = birthdayPicker.date
    let newBirthDay = Birthday(firstName: firstName, lastName: lastName, birthDate: birthDate)
    
    delegate?.addBirthdayViewController(self, didAddBirthday: newBirthDay)
  }
  
  @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
}

