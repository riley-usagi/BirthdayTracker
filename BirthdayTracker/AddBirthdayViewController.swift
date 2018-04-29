import UIKit

class AddBirthdayViewController: UIViewController {

  // Элементы интерфейса
  @IBOutlet var firstNameTextField: UITextField!
  @IBOutlet var lastNameTextField: UITextField!
  @IBOutlet var birthdayPicker: UIDatePicker!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Человек не может родиться в будущем
    birthdayPicker.maximumDate = Date()
  }
  
  @IBAction func saveTapped(_ sender: UIBarButtonItem) {
    print("Нажата кнопка сохранения")
    
    let firstName = firstNameTextField.text ?? ""
    let lastName = lastNameTextField.text ?? ""
    print("Привет! Меня зовут \(firstName) \(lastName).")
  }
}

