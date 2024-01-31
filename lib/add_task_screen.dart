import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController title;
  late TextEditingController date;
  late TextEditingController time;
  late TextEditingController category;
  late TextEditingController note;

  String categoryName = "education";

  @override
  void initState() {
    title = TextEditingController();
    date = TextEditingController();
    time = TextEditingController();
    category = TextEditingController();
    note = TextEditingController();
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                formLabel("Task Title"),
                TextFormField(
                  controller: title,
                  validator: (value) =>
                      value!.trim().isEmpty ? "Title is Required" : null,
                  decoration: InputDecoration(
                    hintText: "Enter task title",
                    fillColor: Color(0XFFF5F2F9),
                    filled: true,
                    enabledBorder: textFieledBorder(),
                    focusedBorder: textFieledBorder(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                formLabel("Category Name"),
                Row(
                  children: [
                    GestureDetector(
                      child: Chip(
                        label: Text(
                          "Education",
                          style: this.categoryName == "education"
                              ? TextStyle(color: Colors.white)
                              : null,
                        ),
                        backgroundColor: this.categoryName == "education"
                            ? Colors.purple
                            : null,
                      ),
                      onTap: () => setState(() {
                        categoryName = "education";
                      }),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        categoryName = "market";
                      }),
                      child: Chip(
                        label: Text(
                          "Market",
                          style: this.categoryName == "market"
                              ? TextStyle(color: Colors.white)
                              : null,
                        ),
                        backgroundColor: this.categoryName == "market"
                            ? Colors.purple
                            : null,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        categoryName = "home";
                      }),
                      child: Chip(
                        label: Text(
                          "Home",
                          style: this.categoryName == "home"
                              ? TextStyle(color: Colors.white)
                              : null,
                        ),
                        backgroundColor:
                            this.categoryName == "home" ? Colors.purple : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        formLabel("Date"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 12,
                          child: TextFormField(
                            controller: date,
                            validator: (value) => value!.trim().isEmpty
                                ? "Date is Required"
                                : null,
                            decoration: InputDecoration(
                              hintText: "Enter date",
                              fillColor: Color(0XFFF5F2F9),
                              filled: true,
                              enabledBorder: textFieledBorder(),
                              focusedBorder: textFieledBorder(),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        formLabel("Time"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 12,
                          child: TextFormField(
                            controller: time,
                            validator: (value) => value!.trim().isEmpty
                                ? "Time is Required"
                                : null,
                            decoration: InputDecoration(
                              hintText: "Enter time",
                              fillColor: Color(0XFFF5F2F9),
                              filled: true,
                              enabledBorder: textFieledBorder(),
                              focusedBorder: textFieledBorder(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                formLabel("Note"),
                TextFormField(
                  controller: note,
                  decoration: InputDecoration(
                    hintText: "Enter note",
                    fillColor: Color(0XFFF5F2F9),
                    filled: true,
                    enabledBorder: textFieledBorder(),
                    focusedBorder: textFieledBorder(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      bool valid = formKey.currentState!.validate();
                      if (valid) {
                        var title = this.title.text.trim();
                        var date = this.date.text.trim();
                        var time = this.time.text.trim();
                        var category = this.categoryName;
                        var note = this.note.text.trim();
                        Map<String, dynamic> data = {
                          "title": title,
                          "description": note,
                          "category_name": category,
                        };
                        Navigator.pop(context, data);
                      } else {
                        print("Form is Invalid");
                      }
                    },
                    child: Text(
                      "Save Task",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding formLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Text(label),
    );
  }

  OutlineInputBorder textFieledBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    );
  }
}
