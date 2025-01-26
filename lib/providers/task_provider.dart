import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_data_filter_demo/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final searchTextController = TextEditingController();
  List<Task> _tasks = [
    Task(title: "Kill someone", priority: 3, isFinished: false),
    Task(title: "Study", priority: 1, isFinished: false),
    Task(title: "Eat burger", priority: 2, isFinished: false),
    Task(title: "Order pizza", priority: 1, isFinished: false),
    Task(title: "Sleep", priority: 3, isFinished: false),
  ];

  bool _isSearching = false;

  List<Task> get tasks{
    String searchText = searchTextController.text.toLowerCase();
    if (searchText.isEmpty) {
      return _tasks;
    }

    List<Task> filteredTaskList = _tasks.where((t) => t.title.toLowerCase().contains(searchText)).toList();
    return filteredTaskList;
  }

  String get searchText => searchTextController.text;

  set tasks(List<Task> tasks) {
    _tasks = tasks;
  }

  void setTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void setSearchText(String text) {
    searchTextController.text = text;
    notifyListeners();
  }

  void removeTask(String taskTitle) {
    _tasks.removeWhere((task) => task.title == taskTitle);
    notifyListeners();
  }

  void clearSearch() {
    searchTextController.clear();
    notifyListeners();
  }

  void toggleSearch() {
    _isSearching = !_isSearching;
    if (!_isSearching) {
      setSearchText("");
    }
    notifyListeners();
  }

  Widget buildTitle() {
    if (_isSearching) {
      return TextField(
        controller: searchTextController,
        onChanged: (value) => setSearchText(value),
        decoration: InputDecoration(
          hintText: "Search...",
          suffixIcon: searchTextController.text.isEmpty
              ? null
              : IconButton(
                  onPressed: () {
                    clearSearch();
                  },
                  icon: const Icon(Icons.clear),
                ),
        ),
      );
    } else {
      return const Text("Task list");
    }
  }
}
