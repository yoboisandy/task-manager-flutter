import 'package:first_app/components/text_title.dart';
import 'package:flutter/material.dart';

import 'components/single_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    SingleTask("education"),
                    Divider(),
                    SingleTask("market"),
                    Divider(),
                    SingleTask("home"),
                  ]),
            ),
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
                    SingleTask("education"),
                    Divider(),
                    SingleTask("market"),
                    Divider(),
                    SingleTask("home"),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
