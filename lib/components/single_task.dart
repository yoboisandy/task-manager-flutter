import 'dart:math';

import 'package:flutter/material.dart';

class SingleTask extends StatelessWidget {
  final Map<String, dynamic> task;
  final String status;
  final Function deleteTask;
  final Function markAsCompleted;

  SingleTask(this.task, this.status, this.deleteTask, this.markAsCompleted);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: task['category_name'] == "education"
              ? Colors.green[100]
              : task['category_name'] == "home"
                  ? Colors.blue[100]
                  : Colors.orange[100],
          border: Border.all(
            color: task['category_name'] == "education"
                ? Colors.green
                : task['category_name'] == "home"
                    ? Colors.blue
                    : Colors.orange,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(360),
        ),
        child: task['category_name'] == "education"
            ? Icon(Icons.school, color: Colors.green, size: 30)
            : task['category_name'] == "home"
                ? Icon(Icons.home, color: Colors.blue, size: 30)
                : Icon(Icons.shopping_cart, color: Colors.orange, size: 30),
      ),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          // Handle the selected option
          if (value == 'view') {
            // log clicked on view
          } else if (value == 'delete') {
            deleteTask();
          } else if (value == 'markAsCompleted') {
            markAsCompleted();
          }
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<String>(
            value: 'view',
            child: Row(
              children: [
                Icon(Icons.visibility),
                SizedBox(width: 8),
                Text('View'),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'delete',
            child: Row(
              children: [
                Icon(Icons.delete),
                SizedBox(width: 8),
                Text('Delete'),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: "markAsCompleted",
            child: Row(
              children: [
                Icon(Icons.check),
                SizedBox(width: 8),
                Text(status == 'completed'
                    ? 'Mark as UnCompleted'
                    : 'Mark as Completed'),
              ],
            ),
          ),
        ],
        icon: Icon(Icons.more_vert, color: Colors.grey),
      ),
      title: Text(
        task['title'],
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        task['description'],
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
