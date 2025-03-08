import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  TextEditingController _taskTextEditingController = TextEditingController();
  List<String> _tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text('To do App', style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskTextEditingController,
                    decoration: InputDecoration(
                        hintText: 'Add a new task',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)
                        )
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey
                    ),
                    onPressed: () {
                      _addNewTask();
                    },
                    child: Text('Add Task', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 40,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index){
                return SizedBox(
                  height: 60,
                  child: Card(
                    color: Color.fromARGB(232, 236, 228, 243),
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: ListTile(
                      title: Text(_tasks[index]),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,))
                    ),
                  ),
                );
              },),
          )
        ],
      ),
    );
  }
  _addNewTask(){
    if(_taskTextEditingController.text.isNotEmpty){
      setState(() {

      });
      _tasks.add(_taskTextEditingController.text);
      _taskTextEditingController.clear();
    }
  }

  _deleteTask(int index){
    _tasks.removeAt(index);
  }

  dispose(){
    _taskTextEditingController.dispose();
    super.dispose();
  }
}
