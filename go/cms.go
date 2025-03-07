package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

type Contact struct {
	Name  string
	Phone string
	Email string
}

type ContactsManager struct {
	Contacts []Contact
}

func (cm *ContactsManager) AddContact(name, phone, email string) {
	cm.Contacts = append(cm.Contacts, Contact{Name: name, Phone: phone, Email: email})
}

func (cm *ContactsManager) ViewContacts() {
	for i, c := range cm.Contacts {
		fmt.Printf("%d. Name: %s, Phone: %s, Email: %s\n", i+1, c.Name, c.Phone, c.Email)
	}
}

func (cm *ContactsManager) UpdateContact(index int, name, phone, email string) {
	if index >= 0 && index < len(cm.Contacts) {
		cm.Contacts[index] = Contact{Name: name, Phone: phone, Email: email}
	}
}

func (cm *ContactsManager) DeleteContact(index int) {
	if index >= 0 && index < len(cm.Contacts) {
		cm.Contacts = append(cm.Contacts[:index], cm.Contacts[index+1:]...)
	}
}

func main() {
	cm := ContactsManager{}
	reader := bufio.NewReader(os.Stdin)
	for {
		fmt.Println("1. Add Contact\n2. View Contacts\n3. Update Contact\n4. Delete Contact\n5. Exit")
		choice, _ := reader.ReadString('\n')
		choice = strings.TrimSpace(choice)
		switch choice {
		case "1":
			fmt.Print("Enter name: ")
			name, _ := reader.ReadString('\n')
			fmt.Print("Enter phone: ")
			phone, _ := reader.ReadString('\n')
			fmt.Print("Enter email: ")
			email, _ := reader.ReadString('\n')
			cm.AddContact(strings.TrimSpace(name), strings.TrimSpace(phone), strings.TrimSpace(email))
		case "2":
			cm.ViewContacts()
		case "3":
			fmt.Print("Enter contact index to update: ")
			var index int
			fmt.Scan(&index)
			fmt.Print("Enter new name: ")
			name, _ := reader.ReadString('\n')
			fmt.Print("Enter new phone: ")
			phone, _ := reader.ReadString('\n')
			fmt.Print("Enter new email: ")
			email, _ := reader.ReadString('\n')
			cm.UpdateContact(index-1, strings.TrimSpace(name), strings.TrimSpace(phone), strings.TrimSpace(email))
		case "4":
			fmt.Print("Enter contact index to delete: ")
			var index int
			fmt.Scan(&index)
			cm.DeleteContact(index - 1)
		case "5":
			return
		}
	}
}
