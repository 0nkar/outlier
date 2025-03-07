Go/Golang Test 1:
Create a program in Go that can read in a JSON file containing three separate lists: nouns, adjectives, and numbers. Then create lists that are specific for each type: nouns, adjectives, and numbers. Next, create a function that can be used to return a random index from a list and use it to get indexes from the prior lists. Lastly, read in `madlib.txt` found below and replace each "(noun)" with a random noun from the noun list, "(adjective)" with a random adjective from the adjective list, and "(number)" with a random number from the number list and output the Madlib into the console with the new changes.



Here is an example JSON: 

	{ "Nouns": [ "an apple," "car," "book," "dog," "house," "sun," "tree," 	"mountain," "ocean," "computer" ], "Numbers": [ 1.5, 3.14, 7, 10.2, 5.5, 2, 	8.7, 4.3, 6.1, 9.9 ], "Adjectives": [ "beautiful," "green," "happy," "small," 	"fast," "old," "bright," "loud," "soft," "brave" ] } 

 

Here is madlib.txt: 

	It was a (adjective) and (adjective) night. For the last (number) nights, the 	(noun) upstairs partied all night long making it impossible for you to sleep.  Finally, you decided to grab your (number) foot long (noun) and marched right on up there to (adjective) -ly tell them what for. 



Go/Golang Test 2:
Create a console-based Contacts Management System that allows users to add, view, update, and delete contacts.

Create a Contact class with properties for name, phone number, and email
Create a ContactsManager class to manage a collection of contacts
Provide methonds to add, view, update, and delete contacts
Implement a console-based user interface that allows users to interact with ContactsManager
Use a loop to keep the program running until the user chooses to exit