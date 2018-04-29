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
    
    // Данные из формы
    let firstName = firstNameTextField.text ?? ""
    let lastName = lastNameTextField.text ?? ""
    let birthDate = birthdayPicker.date
    let newBirthDay = Birthday(firstName: firstName, lastName: lastName, birthDate: birthDate)
    
    print("Создана запись о дне рождения!")
    print("Имя: \(newBirthDay.firstName)")
    print("Фамилия: \(newBirthDay.lastName)")
    print("День рождения: \(newBirthDay.birthDate)")
  }
}

