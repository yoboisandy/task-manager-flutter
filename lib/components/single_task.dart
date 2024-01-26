import 'dart:math';

import 'package:flutter/material.dart';

class SingleTask extends StatelessWidget {
  final String categoryName;

  SingleTask(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: categoryName == "education"
              ? Colors.green[100]
              : Colors.orange[100],
          border: Border.all(
            color: categoryName == "education" ? Colors.green : Colors.orange,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(360),
        ),
        child: categoryName == "education"
            ? Icon(Icons.school, color: Colors.green, size: 30)
            : Icon(Icons.shopping_cart, color: Colors.orange, size: 30),
      ),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          // Handle the selected option
          if (value == 'view') {
            // log clicked on view
          } else if (value == 'delete') {
            // Handle delete action
          } else if (value == 'markAsCompleted') {
            // Handle markAsCompleted action
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
            value: 'markAsCompleted',
            child: Row(
              children: [
                Icon(Icons.check),
                SizedBox(width: 8),
                Text('Mark as Completed'),
              ],
            ),
          ),
        ],
        icon: Icon(Icons.more_vert, color: Colors.grey),
      ),
      title: Text(
        "Must Leave The Schools",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "This is a sub titleThis is a sub titleThis is a sub titleThis is a sub titleThis is a sub titleThis is a sub titleThis is a sub titleThis is a sub titleThis is a sub title",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
