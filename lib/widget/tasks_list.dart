import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      //taskData = Provider.of<TaskData>(context)
      builder:(context, taskData, child) {
        return ListView.builder(itemBuilder: (context,index){
          final task= taskData.tasks[index];
          return TasksTile (
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallback: (){
              taskData.deleteTask(task);
            },
          );
        },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}