class Contact
{
    public string Name { get; set; }
    public string PhoneNumber { get; set; }
    public string Email { get; set; }
}

class ContactsManager
{
    private List<Contact> contacts = new List<Contact>();

    public void AddContact(string name, string phone, string email)
    {
        contacts.Add(new Contact { Name = name, PhoneNumber = phone, Email = email });
    }

    public void ViewContacts()
    {
        foreach (var contact in contacts)
        {
            Console.WriteLine($"Name: {contact.Name}, Phone: {contact.PhoneNumber}, Email: {contact.Email}");
        }
    }

    public void UpdateContact(string name, string newPhone, string newEmail)
    {
        var contact = contacts.FirstOrDefault(c => c.Name == name);
        if (contact != null)
        {
            contact.PhoneNumber = newPhone;
            contact.Email = newEmail;
        }
    }

    public void DeleteContact(string name)
    {
        contacts.RemoveAll(c => c.Name == name);
    }
}

class Program
{
    static void Main()
    {
        var manager = new ContactsManager();
        while (true)
        {
            Console.WriteLine("1. Add Contact");
            Console.WriteLine("2. View Contacts");
            Console.WriteLine("3. Update Contact");
            Console.WriteLine("4. Delete Contact");
            Console.WriteLine("5. Exit");
            var choice = Console.ReadLine();

            if (choice == "1")
            {
                Console.Write("Enter Name: ");
                var name = Console.ReadLine();
                Console.Write("Enter Phone: ");
                var phone = Console.ReadLine();
                Console.Write("Enter Email: ");
                var email = Console.ReadLine();
                manager.AddContact(name, phone, email);
            }
            else if (choice == "2")
            {
                manager.ViewContacts();
            }
            else if (choice == "3")
            {
                Console.Write("Enter Name of Contact to Update: ");
                var name = Console.ReadLine();
                Console.Write("Enter New Phone: ");
                var phone = Console.ReadLine();
                Console.Write("Enter New Email: ");
                var email = Console.ReadLine();
                manager.UpdateContact(name, phone, email);
            }
            else if (choice == "4")
            {
                Console.Write("Enter Name of Contact to Delete: ");
                var name = Console.ReadLine();
                manager.DeleteContact(name);
            }
            else if (choice == "5")
            {
                break;
            }
        }
    }
}
