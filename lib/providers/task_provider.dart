import 'package:flutter/material.dart';
import 'package:flutter_data_filter_demo/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: "Kill someone", priority: 3, isFinished: false),
    Task(title: "Study", priority: 1, isFinished: false),
    Task(title: "Eat burger", priority: 2, isFinished: false),
    Task(title: "Order pizza", priority: 1, isFinished: false),
    Task(title: "Sleep", priority: 3, isFinished: false),
  ];

  List<Task> get tasks => _tasks;

  set tasks(List<Task> tasks) {
    _tasks = tasks;
  }

  void setTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(String taskTitle) {
    _tasks.removeWhere((task) => task.title == taskTitle);
    notifyListeners();
  }
}
