import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var dueDate: Date
}

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func addTask(title: String, description: String, dueDate: Date) {
        let newTask = Task(title: title, description: description, dueDate: dueDate)
        tasks.append(newTask)
    }
}

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.tasks) { task in
                NavigationLink(destination: TaskDetailView(task: task)) {
                    Text(task.title)
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                NavigationLink("Add Task", destination: AddTaskView(viewModel: viewModel))
            }
        }
    }
}

struct AddTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Description", text: $description)
            DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            Button("Save") {
                viewModel.addTask(title: title, description: description, dueDate: dueDate)
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Add Task")
    }
}

struct TaskDetailView: View {
    var task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(task.title).font(.largeTitle)
            Text(task.description)
            Text("Due: \(task.dueDate, formatter: dateFormatter)")
            Spacer()
        }
        .padding()
        .navigationTitle("Task Details")
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
