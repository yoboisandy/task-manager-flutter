import 'package:first_app/add_task_screen.dart';
import 'package:first_app/components/text_title.dart';
import 'package:flutter/material.dart';

import 'components/single_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> completedTasks = [
    {
      "id": 1,
      "category_name": "education",
      "title": "Learn Flutter",
      "description": "Learn flutter to build mobile apps",
    },
    {
      "id": 2,
      "category_name": "market",
      "title": "Buy Groceries",
      "description": "Buy groceries for the week",
    },
    {
      "id": 3,
      "category_name": "home",
      "title": "Clean the house",
      "description": "Clean the house and wash the dishes",
    },
    {
      "id": 4,
      "category_name": "education",
      "title": "Go to school",
      "description": "Go to school to learn flutter",
    },
  ];

  List<Map<String, dynamic>> unCompletedTasks = [
    {
      "id": 1,
      "category_name": "education",
      "title": "Attend Flutter Class",
      "description": "Attend flutter class to learn flutter",
    },
    {
      "id": 2,
      "category_name": "market",
      "title": "Go to the market",
      "description": "Go to the market to buy groceries",
    },
    {
      "id": 3,
      "category_name": "home",
      "title": "Make the bed",
      "description": "Make the bed and wash the dishes",
    },
    {
      "id": 4,
      "category_name": "education",
      "title": "Do homework",
      "description": "Do homework to learn flutter",
    },
    {
      "id": 5,
      "category_name": "home",
      "title": "Clean the garden",
      "description": "Clean the garden and wash the dishes",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            TextTitle("UnCompleted Tasks"),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.purple[50]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < unCompletedTasks.length; i++)
                      Column(
                        children: [
                          SingleTask(unCompletedTasks[i], "uncompleted", () {
                            setState(() {
                              unCompletedTasks.removeAt(i);
                            });
                          }, () {
                            setState(() {
                              completedTasks.add(unCompletedTasks[i]);
                              unCompletedTasks.removeAt(i);
                            });
                          }),
                          Divider(),
                        ],
                      ),
                  ]),
            ),
            SizedBox(height: 8),
            TextTitle("Completed Tasks"),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.purple[50]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < completedTasks.length; i++)
                      Column(
                        children: [
                          SingleTask(completedTasks[i], "completed", () {
                            setState(() {
                              unCompletedTasks.removeAt(i);
                            });
                          }, () {
                            setState(() {
                              unCompletedTasks.add(completedTasks[i]);
                              completedTasks.removeAt(i);
                            });
                          }),
                          Divider(),
                        ],
                      ),
                  ]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddTaskScreen(),
              ));
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
