import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Task{

  String title;
  bool completed;

  Task({
    required this.title,
    required this.completed
  });

}

class TaskManager extends StatefulWidget{

  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}
class _TaskManagerState extends State<TaskManager>{

  final List<Task> _tasks = [
    Task(title: 'Learn Dart', completed: false),
    Task(title: 'Learn Flutter', completed: true),
    Task(title: 'Build Task Manager', completed: false),
    Task(title: 'Learn State Management', completed: false),
    Task(title: 'Practice Flutter', completed: true),
  ];

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Task Manager"),
            Expanded(
              child:ListView.builder(
                itemBuilder: (context,index){
                  final task = _tasks[index];
                  return 
                
                      ListTile(
                        title: Text(task.title),
                        trailing: Checkbox(
                          value: task.completed, 
                          onChanged: (bool? newValue) {
                            setState(() {
                              task.completed=newValue!;
                              
                            });
                            
                          },
                        ),
                      );
                     
                },
                itemCount: _tasks.length,

              )
            )
            
          ],
          
        )

      ),
              

    );

  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:const TaskManager()
    );
  }
}

