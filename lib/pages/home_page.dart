import 'package:flutter/material.dart';
import 'package:flutter_data_filter_demo/providers/task_provider.dart';
import 'package:flutter_data_filter_demo/widgets/task_create_dialog.dart';
import 'package:flutter_data_filter_demo/widgets/task_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> datas = ["Hello", "there", "How", "Are", "You?"];

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Task list"),
          ),
          body: ListView.builder(
            itemCount: model.tasks.length,
            itemBuilder: (context, index) {
              return TaskWidget(task: model.tasks[index]);
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showTaskAddingDialogue();
            },
            child: const Icon(
              Icons.add,
              size: 32.0,
            ),
          ),
        );
      },
    );
  }

  void showTaskAddingDialogue() {
    showDialog(
      context: context,
      builder: (context) => const TaskCreateDialog(),
    );
  }
}
