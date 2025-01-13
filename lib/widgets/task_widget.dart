import 'package:flutter/material.dart';
import 'package:flutter_data_filter_demo/models/task_model.dart';
import 'package:flutter_data_filter_demo/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
        bottom: 25.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: const TextStyle(fontSize: 20.0),
              ),
              Text(
                getPriorityName(task.priority),
                style: const TextStyle(fontSize: 14.0, color: Colors.black38),
              ),
            ],
          ),
          Consumer<TaskProvider>(
            builder: (context, model, child) {
              return IconButton(
                onPressed: () {
                  model.removeTask(task.title);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String getPriorityName(int priority) {
    if (priority == 1) {
      return "Normal";
    } else if (priority == 2) {
      return "Medium";
    } else if (priority == 3) {
      return "High";
    }

    return "Normal";
  }
}
