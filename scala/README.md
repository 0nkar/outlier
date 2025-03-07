Create a small in-memory database in Scala that stores and retrieves key-value pairs.



Requirements:



1. Store Key-Value Pairs:

Implement a class `SimpleDatabase` that allows storing key-value pairs. Keys should be unique strings, and values can be of any type.


2. Retrieve Values:

Provide a method to retrieve the value associated with a key. If the key does not exist, return an appropriate message.


3. Delete Key-Value Pairs:

Implement a method to delete a key-value pair by its key. Ensure the method handles the case where the key does not exist.


4. Display All Key-Value Pairs:

Provide a method to display all key-value pairs stored in the database.


Example Usage:



val db = new SimpleDatabase[String]()

db.put("name", "John Doe")

db.put("age", "30")

println(db.get("name")) // Output: John Doe

db.delete("age")

db.display() // Output: name -> John Doe