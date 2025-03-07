import 'dart:io';

class Task {
  String description;
  bool isCompleted;
  
  Task(this.description, {this.isCompleted = false});
}

void main() {
  List<Task> tasks = [];
  while (true) {
    print("\n1. Add Task\n2. Remove Task\n3. View Tasks\n4. Mark Task as Completed\n5. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();
    
    switch (choice) {
      case '1':
        stdout.write("Enter task description: ");
        String? desc = stdin.readLineSync();
        if (desc != null && desc.isNotEmpty) {
          tasks.add(Task(desc));
          print("Task added.");
        }
        break;
      case '2':
        stdout.write("Enter task number to remove: ");
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index != null && index > 0 && index <= tasks.length) {
          tasks.removeAt(index - 1);
          print("Task removed.");
        }
        break;
      case '3':
        if (tasks.isEmpty) {
          print("No tasks available.");
        } else {
          for (int i = 0; i < tasks.length; i++) {
            print("${i + 1}. [${tasks[i].isCompleted ? 'Completed' : 'Pending'}] ${tasks[i].description}");
          }
        }
        break;
      case '4':
        stdout.write("Enter task number to mark as completed: ");
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index != null && index > 0 && index <= tasks.length) {
          tasks[index - 1].isCompleted = true;
          print("Task marked as completed.");
        }
        break;
      case '5':
        print("Exiting...");
        return;
      default:
        print("Invalid option. Try again.");
    }
  }
}
