import UIKit
import CoreData

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
    let birthdate = birthdayPicker.date
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let newBirthday = Birthday(context: context)
    newBirthday.firstName = firstName
    newBirthday.lastName = lastName
    newBirthday.birthdate = birthdate as Date?
    newBirthday.birthdayId = UUID().uuidString
    
    if let uniqueId = newBirthday.birthdayId {
      print("birthdayId: \(uniqueId)")
    }
    
    do {
      try context.save()
    } catch let error {
      print("Не удалось сохранить из-за ошибки \(error)")
    }
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
}

