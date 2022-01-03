import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';  //ضمنتا مشان اقدر استخدم الميثود UnmodifiableListView

class TaskData extends ChangeNotifier {
  List<Task> _tasks =[
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
    //هيك ماعاد اقدر اعمل tasks.add من ملف ال add_task_screen  وصار فيني استخدم ال task  بباقي الملفات
    //الميثود modifi  لاتدعم ال add
}
  //بس استخدم ال get مشان تحسب شي قيمة وترجعلي ياها
  //عملنا هي الميثود لأنو استخدمنا ال tasks.length  بمكانين
  int get taskCount{
    return _tasks.length;
  }
  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    //اهم شي استدعاء هي الميثود وإلا لن يتم اضافة التاسك ل ال List
    notifyListeners();
  }

  void updateTask(Task task){
     task.toggleDone();
     notifyListeners();
  }
  void deleteTask(Task task){
   _tasks.remove(task);
   notifyListeners();
  }

}
//حطيت ال task برايفت مشان ماأقدر اعمل tasks.add  بملف ال add_task_screen  وانسى الميثود notifyListeners
