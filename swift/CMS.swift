class Contact {
    var name: String
    var phoneNumber: String
    var email: String
    
    init(name: String, phoneNumber: String, email: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

class ContactsManager {
    private var contacts: [Contact] = []
    
    func addContact(name: String, phoneNumber: String, email: String) {
        let contact = Contact(name: name, phoneNumber: phoneNumber, email: email)
        contacts.append(contact)
    }
    
    func viewContacts() {
        for (index, contact) in contacts.enumerated() {
            print("\(index + 1). \(contact.name) - \(contact.phoneNumber) - \(contact.email)")
        }
    }
    
    func updateContact(index: Int, name: String, phoneNumber: String, email: String) {
        if index >= 0 && index < contacts.count {
            contacts[index].name = name
            contacts[index].phoneNumber = phoneNumber
            contacts[index].email = email
        } else {
            print("Invalid index")
        }
    }
    
    func deleteContact(index: Int) {
        if index >= 0 && index < contacts.count {
            contacts.remove(at: index)
        } else {
            print("Invalid index")
        }
    }
}

func main() {
    let manager = ContactsManager()
    while true {
        print("1. Add Contact")
        print("2. View Contacts")
        print("3. Update Contact")
        print("4. Delete Contact")
        print("5. Exit")
        
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 1:
                print("Enter Name:")
                let name = readLine() ?? ""
                print("Enter Phone Number:")
                let phoneNumber = readLine() ?? ""
                print("Enter Email:")
                let email = readLine() ?? ""
                manager.addContact(name: name, phoneNumber: phoneNumber, email: email)
            case 2:
                manager.viewContacts()
            case 3:
                print("Enter contact index to update:")
                if let indexStr = readLine(), let index = Int(indexStr) {
                    print("Enter New Name:")
                    let name = readLine() ?? ""
                    print("Enter New Phone Number:")
                    let phoneNumber = readLine() ?? ""
                    print("Enter New Email:")
                    let email = readLine() ?? ""
                    manager.updateContact(index: index - 1, name: name, phoneNumber: phoneNumber, email: email)
                }
            case 4:
                print("Enter contact index to delete:")
                if let indexStr = readLine(), let index = Int(indexStr) {
                    manager.deleteContact(index: index - 1)
                }
            case 5:
                return
            default:
                print("Invalid option")
            }
        }
    }
}

main()
