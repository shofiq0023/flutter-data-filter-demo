import 'package:flutter/material.dart';
import 'package:flutter_data_filter_demo/models/task_model.dart';
import 'package:flutter_data_filter_demo/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskCreateDialog extends StatefulWidget {
  const TaskCreateDialog({super.key});

  @override
  State<TaskCreateDialog> createState() => _TaskCreateDialogState();
}

class _TaskCreateDialogState extends State<TaskCreateDialog> {
  final TextEditingController titleController = TextEditingController();
  String taskPriority = "High";

  List<DropdownMenuItem<String>> get dropdownList {
    return [
      const DropdownMenuItem(
        value: "High",
        child: Text("High"),
      ),
      const DropdownMenuItem(
        value: "Medium",
        child: Text("Medium"),
      ),
      const DropdownMenuItem(
        value: "Low",
        child: Text("Low"),
      ),
    ];
  }

  int getPriority(String p) {
    if (p == "High") {
      return 3;
    } else if (p == "Medium") {
      return 2;
    } else if (p == "Normal") {
      return 1;
    }

    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create a new task"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: const InputDecoration(label: Text("Task name")),
          ),
          const SizedBox(height: 10.0),
          DropdownButton<String>(
            value: taskPriority,
            isExpanded: true,
            hint: const Text(
              "Type of the show",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onChanged: (String? str) {
              setState(() => taskPriority = str!);
            },
            items: dropdownList,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              child: const Text(
                "Close",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Consumer<TaskProvider>(
              builder: (context, model, child) {
                return MaterialButton(
                  child: const Text(
                    "Create",
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    String taskTitle = titleController.text;
                    int priority = getPriority(taskPriority);
                    Task task = Task(
                        title: taskTitle,
                        priority: priority,
                        isFinished: false);

                    model.setTask(task);
                    print(task);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
