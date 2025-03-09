import 'package:flutter/material.dart';

import 'models/to_do_item.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final TextEditingController _taskNameTEController = TextEditingController();
  final TextEditingController _taskTimeTEController = TextEditingController();
  final List<ToDoItem> _toDoItems = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To do App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: TextFormField(
                      controller: _taskNameTEController,
                      decoration: InputDecoration(
                          hintText: 'Add a new task',),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter task name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),



            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextFormField(
                      controller: _taskTimeTEController,
                      decoration: InputDecoration(
                        hintText: 'Add task time',),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter task time';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),


            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      _addNewTask();
                    },
                    child: Text(
                      'Add Task',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _toDoItems.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 70,
                    child: Card(
                      color: Color.fromARGB(232, 236, 228, 243),
                      elevation: 5,
                      shadowColor: Colors.grey,
                      child: ListTile(
                          title: Text(_toDoItems[index].taskName),
                          subtitle: Text(_toDoItems[index].taskTime),
                          trailing: IconButton(
                              onPressed: () {
                                _deleteTask(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _addNewTask() {
    if (_formKey.currentState!.validate()) {
      final name = _taskNameTEController.text.trim();
      final time = _taskTimeTEController.text.trim();
      if(name.isNotEmpty && time.isNotEmpty){
        setState(() {
          _toDoItems.add(ToDoItem(taskName: name, taskTime: time));
          _taskNameTEController.clear();
          _taskTimeTEController.clear();
        });
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('New task added'))
      );
    }
  }

  // _addNewTask() {
  //   if (_nameTEController.text.isNotEmpty && _idTEController.text.isNotEmpty) {
  //     setState(() {});
  //     _tasks.add(_nameTEController.text);
  //     _nameTEController.clear();
  //     _tasks.add(_idTEController.text);
  //     // showDialog(context: context, builder: (context){
  //     //   return AlertDialog(
  //     //     title: Text('Task Added'),
  //     //     actions: [
  //     //       TextButton(onPressed: (){
  //     //         Navigator.pop(context);
  //     //       }, child: Text('Ok'))
  //     //     ],
  //     //   );
  //     // });
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Task added successfully')));
  //   }
  // }

  _deleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Do you want to delete this task?'),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancle'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _toDoItems.removeAt(index);
                      Navigator.pop(context);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Task deleted successfully')));
                  },
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  dispose() {
    _taskNameTEController.dispose();
    _taskTimeTEController.dispose();
    super.dispose();
  }
}
