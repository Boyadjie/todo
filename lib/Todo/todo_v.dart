import 'package:flutter/material.dart';
import 'package:todo/Todo/todo_vm.dart';

class TodoView extends StatelessWidget {
  final TodoViewModel viewModel = TodoViewModel();

  @override
  Widget build(BuildContext context) {
    return TodoForm(viewModel: viewModel);
  }
}

class TodoForm extends StatefulWidget {
  final TodoViewModel viewModel;

  const TodoForm({Key? key, required this.viewModel}) : super(key: key);

  @override
  _TodoViewState createState() {
    return _TodoViewState();
  }
}

class _TodoViewState extends State<TodoForm> {
  TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTaskForm(context),
            const SizedBox(height: 20),
            _buildTaskList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskForm(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _taskController,
            decoration: const InputDecoration(
              hintText: 'Enter a task',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await widget.viewModel.createTask(context, _taskController.text);
            _taskController.clear();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  Widget _buildTaskList(BuildContext context) {
    return FutureBuilder<List<TaskInfo>>(
      future: widget.viewModel.getTaskList(), // Modify your ViewModel to return a List<TaskInfo>
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final tasks = snapshot.data ?? [];

        return Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return _buildTaskItem(tasks[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildTaskItem(TaskInfo taskInfo) {
    return ListTile(
      title: Text(taskInfo.title),
      leading: Checkbox(
        value: taskInfo.completed,
        onChanged: (value) async {
          if (mounted) {
            await widget.viewModel.updateTask(context, taskInfo.title);
          }
        },
      ),
    );
  }
}
