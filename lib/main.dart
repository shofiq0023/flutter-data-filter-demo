import 'package:flutter/material.dart';
import 'package:flutter_data_filter_demo/pages/home_page.dart';
import 'package:flutter_data_filter_demo/providers/task_provider.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(ChangeNotifierProvider(
    create: (create) => TaskProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, model, child) {
        return MaterialApp(
          title: 'Data Filter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
